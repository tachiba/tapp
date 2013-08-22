module Tapp
  class Configuration
    attr_accessor :default_printer, :report_caller, :logger, :log_color

    def initialize
      reset
    end

    def reset
      self.default_printer = :pretty_print
      self.report_caller   = false
      self.logger = nil
			self.log_color = :yellow
    end

    def logger_configuration
      self.logger = yield if block_given?
    end
  end
end
