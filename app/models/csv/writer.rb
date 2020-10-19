class Csv::Writer
  def initialize
    @column_names = []
    @rows = []
    @current_row = {}
  end

  def begin_row
    @current_row = {}
  end

  def end_row
    @rows.append @current_row
  end

  def col(name, value)
    unless @column_names.include?(name)
      @column_names.append name
    end

    @current_row = @current_row.merge("#{name}" => value)
  end

  def to_s
    s = ""

    # Column headers
    s += @column_names.join(",") + "\n"

    @rows.each do |row|
      s += @column_names.map { |column_name| row.dig(column_name) }.map { |val| val.nil? ? "" : val  }.join(",") + "\n"
    end

    s
  end
end
