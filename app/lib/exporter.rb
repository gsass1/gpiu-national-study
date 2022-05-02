# frozen_string_literal: true

class Exporter
  def initialize
    @column_names = []
    @rows = []
    @current_row = {}
    @prefixes = []
  end

  def begin_row
    @current_row = {}
  end

  def end_row
    @rows.append @current_row
  end

  def full_column_name(name)
    return name unless @prefixes.any?

    "#{@prefixes.join('.')}.#{name}"
  end

  def value(name, value)
    full_name = full_column_name(name)

    @column_names.append full_name unless @column_names.include?(full_name)

    @current_row = @current_row.merge(full_name.to_s => value)
  end

  def prefix(prefix, &block)
    @prefixes << prefix
    block.call
    @prefixes.pop
  end

  def listing(&block); end

  def export(model, prefix: nil)
    return if model.nil?
    raise Exporters::InvalidObject unless model.class.include?(Exportable)

    @prefixes << prefix unless prefix.nil?

    model.class.export_proc.call(self, model)

    @prefixes.pop unless prefix.nil?
  end

  def export_row(model, prefix: nil)
    begin_row
    export(model, prefix: prefix)
    end_row
  end

  def as_string
    raise 'Not implemented'
  end
end
