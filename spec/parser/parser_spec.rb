require_relative '../spec_helper.rb'
require 'parser/parser'

module AeQuotesImporter

  describe Parser do

    before(:each) do
      @lines = IO.readlines(File.expand_path('../data/ae_quotes1.csv', File.dirname(__FILE__)))
      @quotes = Parser.new.parse_all(@lines)
    end

    context "when invalid" do

      it "should return nil when line is empty" do
        expect(Parser.new.parse_line('')).to be_nil
      end

      it "should return nil when line is not empty but is invalid" do
        expect(Parser.new.parse_line('12803;70123')).to be_nil
      end

      it "should not detect quote line as header" do
        expect(Parser.new.is_header(@lines[1])).to be false
      end

    end

    context "when valid" do

      it "should detect header line as header" do
        expect(Parser.new.is_header(@lines[0])).to be true
      end

      it "should parse all quotes" do
        expect(@quotes.size).to eq(5)
      end

      it "should parse date" do
        expect(@quotes[0][:date]).to eq(Date.strptime('2013-12-13', '%Y-%m-%d'))
      end

      it "should parse close price" do
        expect(@quotes[0][:close]).to eq(28.53)
      end

      it "should parse low price" do
        expect(@quotes[0][:low]).to eq(28.29)
      end

      it "should parse high price" do
        expect(@quotes[0][:high]).to eq(28.73)
      end

      it "should parse open price" do
        expect(@quotes[0][:open]).to eq(28.50)
      end

      it "should parse monetary volume price" do
        expect(@quotes[0][:monetary_volume]).to eq(205531568.00)
      end

      it "should parse share volume price" do
        expect(@quotes[0][:share_volume]).to eq(7205100)
      end

    end

  end

end
