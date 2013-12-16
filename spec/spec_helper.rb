require 'standalone_migrations'

ENV['RAILS_ENV'] = Rails.env = 'test'

require 'database_cleaner'
require_relative '../lib/ae_quotes_importer.rb'

RSpec.configure do |config|

  config.color = true
  config.formatter = :documentation

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
