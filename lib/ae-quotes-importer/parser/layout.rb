module AeQuotesImporter

  class Layout

    HEADER_START = 'Data;'

    FIELDS = [
      { :name => :date,             :type => :date },
      { :name => :close,            :type => :decimal },
      { :name => :low,              :type => :decimal },
      { :name => :high,             :type => :decimal },
      { :name => :open,             :type => :decimal },
      { :name => :monetary_volume,  :type => :decimal },
      { :name => :share_volume,     :type => :integer },
    ]

    def self.fields_by_type(type)
      fields = FIELDS.map do |f|
        f[:name] if f[:type] == type
      end
      fields.compact
    end

  end

end
