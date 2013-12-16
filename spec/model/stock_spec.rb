require_relative '../spec_helper.rb'
require 'ae_quotes_importer/model/stock'

module AeQuotesImporter

  describe Stock do

    before(:each) do
      @stock = Stock.create(code: 'PETR4', name: 'PETROBRAS')
    end

    context "when invalid" do

      it "should return nil when parameter is nil" do
        expect(Stock.get_stock(nil)).to eq(nil)
      end

      it "should return nil when parameter is not stock, integer or string" do
        expect(Stock.get_stock(true)).to eq(nil)
      end

      it "should return nil when integer parameter don't match any existing stocks" do
        expect(Stock.get_stock(2)).to eq(nil)
      end

      it "should return nil when string parameter don't match any existing stocks" do
        expect(Stock.get_stock('VALE5')).to eq(nil)
      end

      it "should return nil when stock parameter don't match any existing stocks" do
        expect(Stock.get_stock(Stock.new(code: 'HGTX3', name: 'CIA HERING'))).to eq(nil)
      end

    end

    context "when valid" do

      it "should get stock with stock object" do
        stock = Stock.get_stock(@stock)
        expect(stock).to eq(@stock)
      end

      it "should get stock with stock code" do
        stock = Stock.get_stock('PETR4')
        expect(stock).to eq(@stock)
      end

      it "should get stock with stock id" do
        stock = Stock.get_stock(@stock.id)
        expect(stock).to eq(@stock)
      end

    end

  end

end
