# frozen_string_literal: true

require 'csv'

module Exporters
  class CommaSeparated < ::Exporter
    def as_string
      ::CSV.generate do |csv|
        csv << @column_names

        @rows.each do |row|
          csv << @column_names.map { |column_name| row[column_name] }
        end
      end
    end
  end
end
