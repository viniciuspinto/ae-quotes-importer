require_relative '../spec_helper.rb'
require 'model/stock.rb'
require 'model/ae_quote.rb'
require 'importer/importer.rb'

module AeQuotesImporter

  describe Importer do

    before(:all) do
      @stock = Stock.create(code: 'BBDC4', name: 'BRADESCO')
      @file1_path = File.expand_path('../data/ae_quotes1.csv', File.dirname(__FILE__))
      @file2_path = File.expand_path('../data/ae_quotes2.csv', File.dirname(__FILE__))
    end

    before(:each) do
      importer = Importer.new(:stock_id => @stock.id)
      importer.import_file @file1_path
    end

    it "should import all quotes" do
      expect(AeQuote.where(:stock_id => @stock.id).size).to eq(5)
    end

    it "should replace existing quotes with the same date" do
      importer2 = Importer.new(:stock_id => @stock.id)
      importer2.import_file @file2_path
      expect(AeQuote.where(:stock_id => @stock.id).size).to eq(6)
      expect(AeQuote.where(:stock_id => @stock.id, :date => '2013-12-13').first.close.to_f).to eq(99.99)
    end

    it "should count saved quotes" do
      importer2 = Importer.new(:stock_id => @stock.id)
      importer2.import_file @file2_path
      expect(importer2.saved_quotes).to eq(2)
    end

    it "should count duplicate quotes" do
      importer2 = Importer.new(:stock_id => @stock.id)
      importer2.import_file @file2_path
      expect(importer2.duplicate_quotes).to eq(1)
    end

  end

end
