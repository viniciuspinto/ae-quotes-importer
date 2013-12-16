require_relative '../lib/ae-quotes-importer/bootstrap.rb'
require 'model/stock'

if ARGV.size != 2
  puts "Usage: ruby #{__FILE__} STOCK_CODE STOCK_NAME"
else
  stock = AeQuotesImporter::Stock.create(code: ARGV[0], name: ARGV[1])
  if stock
    puts "Successfully created stock: #{stock.code} - #{stock.name} (ID = #{stock.id})"
  else
    puts "Error creating stock with code '#{ARGV[0]}', name '#{ARGV[1]}'"
  end
end
