require_relative '../spec_helper.rb'
require 'parser/layout'

module AeQuotesImporter

  describe Layout do

    context "when invalid" do
      it "should return empty if type is nil" do
        expect(Layout.fields_by_type(nil).size).to eq(0)
      end
      it "should return empty if type is invalid" do
        expect(Layout.fields_by_type(:apple).size).to eq(0)
      end
    end

    context "when valid" do
      it "should return all date fields" do
        fields = Layout.fields_by_type(:date)
        expect(fields).to eq([:date])
      end
      it "should return all decimal fields" do
        fields = Layout.fields_by_type(:decimal)
        expect(fields).to eq([:close, :low, :high, :open, :monetary_volume])
      end
      it "should return all integer fields" do
        fields = Layout.fields_by_type(:integer)
        expect(fields).to eq([:share_volume])
      end
    end

  end

end
