module AppendixComorbidityParams
  extend ActiveSupport::Concern

  private

  def appendix_comorbidity_params
    [
      :pos_id,:id, :myocardialinfarction, :congestiveheartfailure, :vasculardisease, :cerebrovascular, :dementia, :pulmonary, :tissuedisease, :ulcerdisease, :mildliver, :diabetes, :hemiplegia, :renaldisease, :diabetesorgandamage, :tumor, :leukaemia, :lymphoma, :severeliverdamage, :metastatictumor, :aids
    ]
  end
end
