require 'tapp/printer'
require 'logger'

module Tapp::Printer
  class LoggerPrint < Base
    def print(*args)
      logger.info *args
    end

    def logger
      Tapp.config.logger || Logger.new($stdout)
    end
  end
end
