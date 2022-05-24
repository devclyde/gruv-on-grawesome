yambar = require('yambar')

AWCHAD_PROFILE = os.getenv('AWCHAD_PROFILE') or 'gog'
AWCHAD_MODIFIER = os.getenv('AWCHAD_MODIFIER') or 'Mod4'
AWCHAD_PROFILE_LOCATION = yambar.filesystem.get_configuration_dir() .. '/profiles/' .. AWCHAD_PROFILE .. '/chadrc.lua'

local AWCHAD = require('awchad')

if yambar.filesystem.file_readable(AWCHAD_PROFILE_LOCATION) then
  yambar.logger.__core_info("found chadrc.lua (profile '%s')", AWCHAD_PROFILE)
  yambar.logger.__set_profile()

  local ok, result = pcall(require, 'profiles.' .. AWCHAD_PROFILE .. '.chadrc')

  if not ok then
    yambar.logger.__core_error("couldn't initialise chadrc.lua (profile '%s')\n\n%s", AWCHAD_PROFILE, result)
    os.exit(1)
  end

  AWCHAD.__validate_profile(result)
  AWCHAD.__initialise_beautiful(result.ui.theme or nil)
  AWCHAD.__cache_required(result)
  AWCHAD.__create_dependencies(result.cached)
  AWCHAD.__initialise_signals(result.signals)
  AWCHAD.__initialise_global_keybindings(result.mappings.global.keyboard or {})
  AWCHAD.__initialise_global_mousebindings(result.mappings.global.mouse or {})
  AWCHAD.__finish()
else
  yambar.logger.__core_error("could not find chadrc.lua (profile '%s')", AWCHAD_PROFILE)
end

---@type table
awesome = awesome
---@type table
client = client
---@type table
screen = screen
---@type table
tag = tag
