require_relative '../spec_helper.rb'
require 'model/stock'
require 'model/ae_quote'

module AeQuotesImporter

  describe AeQuote do

    before(:each) do
      @stock = Stock.create(code: 'BBDC4', name: 'BRADESCO')
      @quote = {
        stock_id: @stock.id,
        date: Date.new(2013, 12, 16),
        close: 10,
        low: 9,
        high: 12,
        open: 11,
        monetary_volume: 10000,
        share_volume: 1000
      }
    end

    it "should insert a new quote when there's no quote with the same date" do
      AeQuote.replace(@quote)
      @quote[:date] = @quote[:date] + 1
      AeQuote.replace(@quote)
      expect(AeQuote.count).to eq(2)
    end

    it "should replace existing quotes with the same date" do
      AeQuote.replace(@quote)
      @quote[:close] = 99
      AeQuote.replace(@quote)
      saved_quotes = AeQuote.where(:stock_id => @quote[:stock_id], :date => @quote[:date])
      expect(saved_quotes.size).to eq(1)
      expect(saved_quotes.first.close).to eq(99)
    end

  end

end
