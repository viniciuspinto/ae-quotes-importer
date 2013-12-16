$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'logger'
require 'active_record'
require 'standalone_migrations'
require 'ae_quotes_importer/model/stock'
require 'ae_quotes_importer/model/ae_quote'
require 'ae_quotes_importer/parser/layout'
require 'ae_quotes_importer/parser/parser'
require 'ae_quotes_importer/importer/importer'

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
