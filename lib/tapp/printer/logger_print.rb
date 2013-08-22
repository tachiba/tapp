require 'tapp/printer'
require 'logger'

module Tapp::Printer
  class LoggerPrint < Base
    def print(*args)
			if Gem.available?('rainbow')
				logger.info args.first.foreground(Tapp.config.log_color)
			else
				logger.info *args
			end
    end

    def logger
      Tapp.config.logger || Logger.new($stdout)
    end
  end
end
