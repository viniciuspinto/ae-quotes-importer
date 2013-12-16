Gem::Specification.new do |s|
  s.name        = 'ae_quotes_importer'
  s.version     = '0.1.0'
  s.summary     = "Import Bovespa stock quotes to a database from .csv files provided by AE"
  s.description = "A parser and importer of stock quotes from .csv files in the format specified by Agência Estado. These quote files can be downloaded from the Investor Relations sites of some of the companies listed on Bovespa."
  s.author      = 'Vinicius Pinto'
  s.email       = 'contact@codense.com'
  s.licenses    = ['MIT']
  s.files       = [
    "ae_quotes_importer.gemspec",
    "db/config.yml",
    "db/migrate/20131130212223_create_stocks.rb",
    "db/migrate/20131215154547_create_ae_quotes.rb",
    "db/schema.rb",
    "lib/ae_quotes_importer.rb",
    "lib/ae_quotes_importer/importer/importer.rb",
    "lib/ae_quotes_importer/model/ae_quote.rb",
    "lib/ae_quotes_importer/model/stock.rb",
    "lib/ae_quotes_importer/parser/layout.rb",
    "lib/ae_quotes_importer/parser/parser.rb",
    "Rakefile",
    "spec/data/ae_quotes1.csv",
    "spec/data/ae_quotes2.csv",
    "spec/importer/importer_spec.rb",
    "spec/model/ae_quote_spec.rb",
    "spec/model/stock_spec.rb",
    "spec/parser/layout_spec.rb",
    "spec/parser/parser_spec.rb",
    "spec/spec_helper.rb",
    "tasks/create_stock.rb",
    "tasks/import_ae_quotes.rb",
    "README.md",
    "LICENSE"
  ]
  s.homepage    = 'https://github.com/viniciuspinto/ae-quotes-importer'
  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'database_cleaner', '~> 1.2.0'
  s.add_development_dependency 'rake', '~> 10.1.0'
  s.add_runtime_dependency 'mysql2', '~> 0.3.14'
  s.add_runtime_dependency 'activerecord', '~> 3.2.15'
  s.add_runtime_dependency 'standalone_migrations', '~> 2.1.1'
end
