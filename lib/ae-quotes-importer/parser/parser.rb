require 'model/ae_quote.rb'
require 'parser/layout.rb'

module AeQuotesImporter

  class Parser

    def parse_all(lines)
      quotes = []
      lines.each do |line|
        quote = parse_line(line)
        if quote.is_a?(Hash) and not quote.empty?
          quotes.push quote
        end
      end
      quotes
    end

    def parse_line(line)
      row = split_line(line)
      if row.is_a?(Hash) and not row.empty?
        cast row
      end
    end

    def split_line(line)
      line.strip!
      if not is_header(line)
        row = {}
        cols = line.split(';')
        fields = Layout::FIELDS
        if cols.size == fields.size
          fields.each_with_index do |field, i|
            row[field[:name]] = cols[i]
          end
          return row
        else
          AeQuotesImporter::logger.info("Line parse, columns count != fields count: #{cols.size} / #{fields.size}")
        end
      end
    end

    def is_header(line)
      line.index(Layout::HEADER_START) == 0
    end

    def cast(row)

      types = {
        :date    => Proc.new { |v| Date.parse(v, '%d/%m/%Y') },
        :integer => Proc.new { |v| v.to_i },
        :decimal => Proc.new { |v| BigDecimal.new(v.sub(',', '.')) },
      }

      types.each do |type, converter|
        values = Layout.fields_by_type(type)
        values.each do |f|
          if not row[f].nil?
            row[f] = converter.call row[f]
          end
        end
      end

      row

    end

  end

end
