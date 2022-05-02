# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Exporters::CommaSeparated do
  class ExportableClass
    include Exportable

    attr_accessor :hello, :world

    def initialize(hello:, world:)
      self.hello = hello
      self.world = world
    end

    exports_as do |e, me|
      e.value 'hello', me.hello
      e.value 'world', me.world
    end
  end

  class ExportableClassWithChildren
    include Exportable

    attr_accessor :my_exportable, :thing

    def initialize
      self.my_exportable = ExportableClass.new(hello: 'Yo', world: 'Sup')
      self.thing = 'thing'
    end

    exports_as do |e, me|
      e.value 'my_thing', me.thing

      e.export me.my_exportable, prefix: 'my_exportable'
    end
  end

  let(:exporter) { described_class.new }
  let(:exportable_instance) { ExportableClass.new(hello: 'Hello', world: 'World') }
  let(:exportable_children_instance) { ExportableClassWithChildren.new }

  it 'can be exported' do
    exporter.export_row(exportable_instance)

    expect(exporter.as_string).to eq("hello,world\nHello,World\n")
  end

  it 'includes the prefix' do
    exporter.export_row(exportable_instance, prefix: 'stuff')

    expect(exporter.as_string).to eq("stuff.hello,stuff.world\nHello,World\n")
  end

  it 'can export children' do
    exporter.export_row(exportable_children_instance, prefix: 'stuff')

    expect(exporter.as_string).to eq("stuff.my_thing,stuff.my_exportable.hello,stuff.my_exportable.world\nthing,Yo,Sup\n")
  end
end
