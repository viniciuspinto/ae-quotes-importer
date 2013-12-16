module AeQuotesImporter

  class AeQuote < ActiveRecord::Base
    
    belongs_to :stock

    def self.replace(quote)
      existing = where(:stock_id => quote[:stock_id], :date => quote[:date])
      if existing.size > 0
        existing.destroy_all
      end
      create(quote)
    end

  end

end

