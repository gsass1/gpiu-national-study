# frozen_string_literal: true

module Exportable
  extend ActiveSupport::Concern

  class_methods do
    attr_accessor :export_proc

    def exports_as(&export_proc)
      self.export_proc = export_proc
    end

    def export(collection)
      Exporters::CommaSeparated.new.tap do |e|
        collection.each do |resource|
          e.export_row resource
        end
      end.as_string
    end
  end
end
