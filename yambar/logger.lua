local YAMBAR_LOGGER = {}
local __INTERNAL_YAMBAR_LOGGER = {
  profile = 'unknown'
}

local validate = function (level)
  assert(type(level.prefix) == 'string', 'invalid typeof(YAMBAR_LOGGER::level->prefix)')
  assert(type(level.color) == 'string', 'invalid typeof(YAMBAR_LOGGER::level->color)')
end

YAMBAR_LOGGER.LEVELS = {
  info = {
    prefix = 'info: ',
    color = '\27[32m'
  },
  warn = {
    prefix = 'warn: ',
    color = '\27[33m',
  },
  error = {
    prefix = 'error: ',
    color = '\27[31m'
  },
  debug = {
    prefix = 'report: ',
    color = '\27[34m'
  }
}

---Log a message.
---@param level table Log level.
---@param message string Log message.
---@param ... any String format
YAMBAR_LOGGER.__core_log = function (level, message, ...)
  validate(level)

  print(string.format('%score::%s\27[0m%s', level.color, level.prefix, string.format(message, ...)))
end

YAMBAR_LOGGER.__core_info = function (message, ...)
  YAMBAR_LOGGER.__core_log(YAMBAR_LOGGER.LEVELS.info, message, ...)
end

YAMBAR_LOGGER.__core_warn = function (message, ...)
  YAMBAR_LOGGER.__core_log(YAMBAR_LOGGER.LEVELS.warn, message, ...)
end

YAMBAR_LOGGER.__core_error = function (message, ...)
  YAMBAR_LOGGER.__core_log(YAMBAR_LOGGER.LEVELS.error, message, ...)
end

YAMBAR_LOGGER.__core_debug = function (message, ...)
  YAMBAR_LOGGER.__core_log(YAMBAR_LOGGER.LEVELS.debug, message, ...)
end

---Log a message.
---@param level table Log level.
---@param message string Log message.
---@param ... any String format
YAMBAR_LOGGER.log = function (level, message, ...)
  validate(level)

  print(string.format('%s%s::%s\27[0m%s', level.color, __INTERNAL_YAMBAR_LOGGER.profile, level.prefix, string.format(message, ...)))
end

YAMBAR_LOGGER.info = function (message, ...)
  YAMBAR_LOGGER.log(YAMBAR_LOGGER.LEVELS.info, message, ...)
end

YAMBAR_LOGGER.warn = function (message, ...)
  YAMBAR_LOGGER.log(YAMBAR_LOGGER.LEVELS.warn, message, ...)
end

YAMBAR_LOGGER.error = function (message, ...)
  YAMBAR_LOGGER.log(YAMBAR_LOGGER.LEVELS.error, message, ...)
end

YAMBAR_LOGGER.debug = function (message, ...)
  YAMBAR_LOGGER.log(YAMBAR_LOGGER.LEVELS.debug, message, ...)
end

YAMBAR_LOGGER.__set_profile = function ()
  if yambar.filesystem.file_readable(AWCHAD_PROFILE_LOCATION) then
    __INTERNAL_YAMBAR_LOGGER.profile = AWCHAD_PROFILE
    YAMBAR_LOGGER.__core_info("set logger profile for '%s'", AWCHAD_PROFILE)
  end
end

return YAMBAR_LOGGER
