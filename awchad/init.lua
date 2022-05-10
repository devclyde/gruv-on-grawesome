local CHAD = {}
local __INTERNAL_CHAD = {
  beautiful_init = false
}

local beautiful = require('beautiful')

CHAD.__validate_profile = function (profile)
  assert(profile.signals, 'profile signals cannot be nil')
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

      if signal.resolve_dependencies then
        -- TODO!
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

return CHAD
