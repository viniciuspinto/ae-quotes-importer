module AeQuotesImporter

  class Stock < ActiveRecord::Base
  
    has_many :ae_quotes

    def self.get_stock(stock)
      result = nil
      case stock.class.to_s
        when 'AeQuotesImporter::Stock'
          existing = Stock.where(:id => stock.id)
          result = existing.size > 0 ? existing.first : nil
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

  end

end
