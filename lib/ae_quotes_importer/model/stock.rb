module AeQuotesImporter

  class Stock < ActiveRecord::Base
  
    has_many :ae_quotes

    def self.get_stock(stock)
      result = nil
      case stock.class.to_s
        when 'AeQuotesImporter::Stock'
          result = Stock.where(:id => stock.id).first
        when 'String'
          if stock =~ /^\d+/
            result = Stock.where(:id => stock).first
          else
            result = Stock.where(:code => stock).first
          end
        else
          if stock.is_a?(Fixnum)
            result = Stock.where(:id => stock).first
          end
      end
      return result
    end

    def self.create_with_table_name(stock_data, custom_table_name)
      if custom_table_name
        Stock.table_name = custom_table_name
      end
      stock = Stock.new
      stock.code = stock_data[:code]
      stock.name = stock_data[:name]
      stock.save
    end

  end

end
