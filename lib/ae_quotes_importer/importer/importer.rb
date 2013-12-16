module AeQuotesImporter

  class Importer

    attr_reader :saved_quotes, :duplicate_quotes

    def initialize(opts = {})
      @stock_id = opts[:stock_id] || nil
      @parser = opts[:parser] || AeQuotesImporter::Parser.new
      @saved_quotes = 0
      @duplicate_quotes = 0
    end

    def import_file(file_path)
      if @stock_id
        if File.exist?(file_path) and File.readable?(file_path)
          import_lines IO.readlines(file_path)
        else
          AeQuotesImporter::logger.error("Cannot read file: #{file_path}")
        end
      else
        AeQuotesImporter::logger.error("Stock is invalid, cannot import file.")
      end
    end

    def import_lines(lines)
      quotes = @parser.parse_all(lines)
      quotes.each do |quote|
        if duplicate?(quote)
          @duplicate_quotes += 1
        end
        save_quote quote
      end
    end

    def duplicate?(quote)
      AeQuote.where(:stock_id => @stock_id, :date => quote[:date]).size > 0
    end

    def quote_data_for_db(quote)
      {
        stock_id: @stock_id,
        date: quote[:date],
        close: quote[:close],
        low: quote[:low],
        high: quote[:high],
        open: quote[:open],
        monetary_volume: quote[:monetary_volume],
        share_volume: quote[:share_volume]
      }
    end

    def save_quote(quote)
      AeQuote.replace quote_data_for_db(quote)
      @saved_quotes += 1
    end

  end

end
