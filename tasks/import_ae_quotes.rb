require_relative '../lib/ae_quotes_importer.rb'
require 'ae_quotes_importer/model/stock'
require 'ae_quotes_importer/importer/importer'

if ARGV.size != 2
  puts "Usage: ruby #{__FILE__} (STOCK_CODE | STOCK_ID) QUOTES_FILE_PATH"
else
  stock = AeQuotesImporter::Stock.get_stock(ARGV[0])
  if stock.nil?
    puts "Invalid stock, please use a valid stock code or stock ID."
  else
    importer = AeQuotesImporter::Importer.new(stock_id: stock.id)
    importer.import_file(ARGV[1])
    puts "Stock: #{stock.code} - #{stock.name} (ID = #{stock.id})"
    puts "Saved quotes: #{importer.saved_quotes}"
    puts "Duplicate quotes (overwritten): #{importer.duplicate_quotes}"
  end
end
