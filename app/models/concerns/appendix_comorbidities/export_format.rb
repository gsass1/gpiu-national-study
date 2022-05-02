# frozen_string_literal: true

module AppendixComorbidities
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        e.value 'i', p.severity_one
        if p.severity_one
          e.value 'i.a', p.myocardialinfarction
          e.value 'i.b', p.congestiveheartfailure
          e.value 'i.c', p.vasculardisease
          e.value 'i.d', p.cerebrovascular
          e.value 'i.e', p.dementia
          e.value 'i.f', p.pulmonary
          e.value 'i.g', p.tissuedisease
          e.value 'i.h', p.ulcerdisease
          e.value 'i.i', p.mildliver
          e.value 'i.j', p.diabetes
        end

        e.value 'ii', p.severity_two
        if p.severity_two
          e.value 'ii.a', p.hemiplegia
          e.value 'ii.b', p.renaldisease
          e.value 'ii.c', p.diabetesorgandamage
          e.value 'ii.d', p.tumor
          e.value 'ii.e', p.leukaemia
          e.value 'ii.f', p.lymphoma
        end

        e.value 'iii', p.severity_three
        e.value 'iii.a', p.severeliverdamage if p.severity_three

        e.value 'iv', p.severity_four
        if p.severity_four
          e.value 'iv.a', p.metastatictumor
          e.value 'iv.b', p.aids
        end
      end
    end
  end
end
