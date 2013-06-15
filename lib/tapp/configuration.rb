module Tapp
  class Configuration
    attr_accessor :default_printer, :report_caller, :logger

    def initialize
      reset
    end

    def reset
      self.default_printer = :pretty_print
      self.report_caller   = false
      self.logger = nil
    end

    def logger_configuration
      self.logger = yield if block_given?
    end
  end
end
