yambar = require('yambar')

AWCHAD_PROFILE = os.getenv('AWCHAD_PROFILE') or 'default'
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
  AWCHAD.__initialise_signals(result.signals)
else
  yambar.logger.__core_error("could not find chadrc.lua (profile '%s')", AWCHAD_PROFILE)
end