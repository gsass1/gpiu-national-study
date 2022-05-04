# frozen_string_literal: true

module AppendixComorbidityParams
  extend ActiveSupport::Concern

  private

  def appendix_comorbidity_params
    %i[
      pos_id id severity_one severity_two severity_three severity_four myocardialinfarction congestiveheartfailure vasculardisease cerebrovascular dementia pulmonary tissuedisease ulcerdisease mildliver diabetes hemiplegia renaldisease diabetesorgandamage tumor leukaemia lymphoma severeliverdamage metastatictumor aids
    ]
  end
end
