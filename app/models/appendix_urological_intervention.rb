# frozen_string_literal: true

class AppendixUrologicalIntervention < ApplicationRecord
  include Bitmask
  include Exportable

  include AppendixUrologicalInterventions::Sanitization
  include AppendixUrologicalInterventions::Validation
  include AppendixUrologicalInterventions::ExportFormat

  ENDOSCOPIC = %w[endoscopic_other cystoscopy diagnostic_ureterorenoscopy tur_p tur_bt urs_with_stone_treatment pcnl
                  ureteral_stent_placement].freeze
  PERCUTANEOUS = %w[percutaneous_other pnp].freeze
  LAPAROSCOPIC = %w[laparoscopic_other kidney_abdominal_testis lymph_node_dissection prostatectomy
                    cystectomy_and_urinary_diversion].freeze
  OPEN_SURGERY = %w[open_surgery_other vasectomy inguinal_scrotal_and_penile rplnd open_prostatectomy simple_nephrectomy
                    radical_nephrectomy rrp cystectomy_and_urinary_diversion].freeze
  PROSTATE_BIOPSY = %w[prostate_biopsy_other transrectal perineal].freeze
  OTHERS = ['eswl'].freeze

  belongs_to :uti_ssi_history, optional: true
  delegate :uti_form_needed?, to: :uti_ssi_history
  delegate :ssi_form_needed?, to: :uti_ssi_history

  bitmask :endoscopic_uti, ENDOSCOPIC, suffix: '_uti'
  bitmask :percutaneous_uti, PERCUTANEOUS, suffix: '_uti'
  bitmask :laparoscopic_uti, LAPAROSCOPIC, suffix: '_uti'
  bitmask :open_surgery_uti, OPEN_SURGERY, suffix: '_uti'
  bitmask :prostate_biopsy_uti, PROSTATE_BIOPSY, suffix: '_uti'
  bitmask :others_uti, OTHERS, suffix: '_uti'

  bitmask :endoscopic_ssi, ENDOSCOPIC, suffix: '_ssi'
  bitmask :percutaneous_ssi, PERCUTANEOUS, suffix: '_ssi'
  bitmask :laparoscopic_ssi, LAPAROSCOPIC, suffix: '_ssi'
  bitmask :open_surgery_ssi, OPEN_SURGERY, suffix: '_ssi'
  bitmask :prostate_biopsy_ssi, PROSTATE_BIOPSY, suffix: '_ssi'
  bitmask :others_ssi, OTHERS, suffix: '_ssi'

  enum contamination_uti: { clean: 0, clean_contaminated: 1, clean_contaminated_bowel: 2, contaminated: 3, infected: 4 },
       _prefix: true
  enum contamination_ssi: { clean: 0, clean_contaminated: 1, clean_contaminated_bowel: 2, contaminated: 3, infected: 4 },
       _prefix: true
end
