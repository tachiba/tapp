Feature: Object#taplog
  Scenario: Call taplog within methods chain
    Given I have the following code:
    """
    require 'logger'
    Tapp.config.logger_configuration do
      logger = Logger.new($stdout)
      logger.formatter = proc do |severity, datetime, progname, msg|
        "#{msg}\n"
      end
      logger
    end
    (1..5).taplog.select(&:odd?).taplog.inject(&:+).taplog
    """

    When Ruby it

    Then I should see:
    """
    1..5
    [1, 3, 5]
    9
    """
