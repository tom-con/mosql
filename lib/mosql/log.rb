require 'log4r/yamlconfigurator'

module MoSQL
  module Logging

    def log
      Logging.logger
    end

    def self.logger
      unless @logger
        @logger = Log4r::Logger.new("MoSQL")
        @logger.add Log4r::Outputter.stderr
      end
      @logger
    end

    def self.configure_level(level)
      Logging.logger.level = level
    end

    def self.configure_by_yaml(yaml_file)
      Log4r::YamlConfigurator.load_yaml_file(yaml_file)
      @logger = Log4r::Logger['MoSQL']
    end

  end
end
