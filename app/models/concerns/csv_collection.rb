# NOTE(gian): allows a model or an array of things to be converted to a CSV file.
#
# When you include this concern you must define a class with the name Csv::#{class.name} (see csv folder)
#
# See Csv::Department for an example usage.
#
# To use this: do something like:
#
#   Department.as_csv_collection(Department.all)
#
module CsvCollection
  extend ActiveSupport::Concern

  class_methods do
    def as_csv_collection(arr)
      csv_writer = "Csv::#{name}".constantize.new

      arr.each do |a|
        csv_writer.begin_row
        csv_writer.row(a)
        csv_writer.end_row
      end

      csv_writer.to_s
    end
  end
end
