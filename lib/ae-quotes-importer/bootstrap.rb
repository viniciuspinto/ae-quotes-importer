$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'logger'
require 'active_record'
require 'standalone_migrations'

module AeQuotesImporter

  def self.logger
    @logger
  end

  def self.logger=(logger)
    @logger = logger
  end

end

Rails.env = 'development' unless Rails.env

AeQuotesImporter::logger = Logger.new(STDOUT)
AeQuotesImporter::logger.level = (Rails.env == 'development' ? Logger::DEBUG : Logger::WARN)

configurator = StandaloneMigrations::Configurator.new
ActiveRecord::Base.establish_connection configurator.config_for(Rails.env)
