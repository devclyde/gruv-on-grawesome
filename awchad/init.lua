local awful = require('awful')

local CHAD = {}
local __INTERNAL_CHAD = {
  beautiful_init = false,
  cached = {}
}

local beautiful = require('beautiful')

CHAD.__validate_profile = function (profile)
  assert(profile.signals, 'profile signals cannot be nil')
end

CHAD.__cache_required = function (profile)
  __INTERNAL_CHAD.cached['__chadrc'] = profile
end

CHAD.__create_dependencies = function (dependencies)
  for _, dependency in ipairs(dependencies) do
    if _ ~= yambar.table.count_keys(dependencies) then
      assert(type(dependency.data.injection) == 'table', '`dependency::data->injection` must be a `table`')

      if dependency.data.resolve_dependencies then
        assert(type(dependency.data.dependencies) == 'table', '`signal::data->dependencies` must be a `table`')

        dependency.data.dependencies = __INTERNAL_CHAD.__resolve_dependencies(dependency.data.dependencies)
      end

      if dependency.data.injection.type == 'widget' then
        assert(type(dependency.create) == 'function', '`dependency::create` must be a `function`')

        __INTERNAL_CHAD.cached[dependency.data.injection.name] = dependency.create()
      end

      if __INTERNAL_CHAD.cached[dependency.data.injection.name] then
        yambar.logger.__core_info("dependency '%s' has been cached", dependency.data.injection.name)
      end
    end
  end
end

CHAD.__initialise_beautiful = function (theme)
  if __INTERNAL_CHAD.beautiful_init == true then
    yambar.logger.__core_error("cannot override beautiful theme (profile '%s')", AWCHAD_PROFILE)
    return
  end

  if theme ~= nil then
    local ok, result = pcall(beautiful.init, theme)

    if not ok then
      yambar.logger.__core_error("couldn't initialise beautiful theme (profile '%s')\n\n%s", AWCHAD_PROFILE, result)
    end
  else
    yambar.logger.__core_warn("theme is nil, loading fallback (profile '%s')", AWCHAD_PROFILE)
    CHAD.__initialise_beautiful(require('awchad.__fallback_theme'))
  end

  __INTERNAL_CHAD.beautiful_init = true
end

CHAD.__initialise_signals = function (signals)
  local function validate(signal)
    assert(type(signal.get_host) == 'function', '`signal::get_host` must be a `function`')
    assert(type(signal.get_address) == 'function', '`signal::get_address` must be a `function`')
    assert(type(signal.get_address) == 'function', '`signal::callback` must be a `function`')
    assert(type(signal.data) == 'table', '`signal::data` must be a `table`')
    assert(type(signal.data.resolve_dependencies) == 'boolean', '`signal::data->resolve_dependencies` must be a `boolean`')
  end

  for _, signal in ipairs(signals) do
    if _ ~= yambar.table.count_keys(signals) then
      validate(signal)

      if signal.data.resolve_dependencies then
        assert(type(signal.data.dependencies) == 'table', '`signal::data->dependencies` must be a `table`')

        signal.data.dependencies = __INTERNAL_CHAD.__resolve_dependencies(signal.data.dependencies)
      end

      local host = signal.get_host()
      local address = signal.get_address()

      assert(type(host.connect_signal) == 'function', '`signal::get_host()` must return a valid host')

      local ok, result = pcall(host.connect_signal, address, signal.on_trigger)

      if not ok then
        yambar.logger.error("couldn't connect signal '%s'\n\n%s", address, result)
      else
        pcall(signal.on_connect)
      end
    end
  end
end

CHAD.__initialise_global_keybindings = function (keybindings)
  for _, group in ipairs(keybindings) do
    if _ ~= yambar.table.count_keys(keybindings) then
      assert(type(group.create) == 'function', '`group::create` must be a function')

      if group.data ~= nil then
        if group.data.resolve_dependencies then
          group.data.dependencies = __INTERNAL_CHAD.__resolve_dependencies(group.data.dependencies)
        end
      end

      for _, keybinding in ipairs(group.create()) do
        awful.keyboard.append_global_keybinding(keybinding)
      end
    end
  end
end

CHAD.__initialise_global_mousebindings = function (mousebindings)
  for _, group in ipairs(mousebindings) do
    if _ ~= yambar.table.count_keys(mousebindings) then
      assert(type(group.create) == 'function', '`group::create` must be a function')

      if group.data ~= nil then
        if group.data.resolve_dependencies then
          group.data.dependencies = __INTERNAL_CHAD.__resolve_dependencies(group.data.dependencies)
        end
      end

      for _, mousebinding in ipairs(group.create()) do
        awful.mouse.append_global_mousebinding(mousebinding)
      end
    end
  end
end

__INTERNAL_CHAD.__resolve_dependencies = function (dependencies)
  assert(type(dependencies) == 'table', '`data::dependencies` must be a table')

  for name, _ in pairs(dependencies) do
    for cached_name, cached_value in pairs(__INTERNAL_CHAD.cached) do
      if name == cached_name then
        dependencies[name] = cached_value
      end
    end
  end

  return dependencies
end

return CHAD
