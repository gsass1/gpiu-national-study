class CreateSusceptibilityTests < ActiveRecord::Migration[6.1]
  def change
    create_table :susceptibility_tests do |t|
      t.references :appendix_culture_result, null: false, foreign_key: true

      t.bigint :pos_id

      t.string :pathogen
      t.string :pathogen_specify
      t.integer :cfu

      t.boolean "aminoglycosides", default: false
      t.boolean "aminoglycosides_amikacin", default: false
      t.integer "aminoglycosides_amikacin_s", limit: 2
      t.boolean "aminoglycosides_gentamicin", default: false
      t.integer "aminoglycosides_gentamicin_s", limit: 2
      t.boolean "aminoglycosides_netilmicin", default: false
      t.integer "aminoglycosides_netilmicin_s", limit: 2
      t.boolean "aminoglycosides_tobramicin", default: false
      t.integer "aminoglycosides_tobramicin_s", limit: 2
      t.boolean "carbapenem", default: false
      t.boolean "carbapenem_doripenem", default: false
      t.integer "carbapenem_doripenem_s", limit: 2
      t.boolean "carbapenem_ertapenem", default: false
      t.integer "carbapenem_ertapenem_s", limit: 2
      t.boolean "carbapenem_imipenem", default: false
      t.integer "carbapenem_imipenem_s", limit: 2
      t.boolean "cephalosporins", default: false
      t.boolean "cephalosporins_cefepime", default: false
      t.integer "cephalosporins_cefepime_s", limit: 2
      t.boolean "cephalosporins_cefotaxime", default: false
      t.integer "cephalosporins_cefotaxime_s", limit: 2
      t.boolean "cephalosporins_cefotetan", default: false
      t.integer "cephalosporins_cefotetan_s", limit: 2
      t.boolean "cephalosporins_cefoxitin", default: false
      t.integer "cephalosporins_cefoxitin_s", limit: 2
      t.boolean "cephalosporins_ceftaroline", default: false
      t.integer "cephalosporins_ceftaroline_s", limit: 2
      t.boolean "cephalosporins_ceftazidime", default: false
      t.integer "cephalosporins_ceftazidime_s", limit: 2
      t.boolean "cephalosporins_cefuroxime", default: false
      t.integer "cephalosporins_cefuroxime_s", limit: 2
      t.boolean "cephalosporins_cephazolin", default: false
      t.integer "cephalosporins_cephazolin_s", limit: 2
      t.boolean "clindamycin", default: false
      t.integer "clindamycin_s", limit: 2
      t.boolean "daptomycin", default: false
      t.integer "daptomycin_s", limit: 2
      t.boolean "erythromycin", default: false
      t.integer "erythromycin_s", limit: 2
      t.boolean "fluoroquinolones", default: false
      t.boolean "fluoroquinolones_ciprofloxacin", default: false
      t.integer "fluoroquinolones_ciprofloxacin_s", limit: 2
      t.boolean "fluoroquinolones_levofloxacin", default: false
      t.integer "fluoroquinolones_levofloxacin_s", limit: 2
      t.boolean "fluoroquinolones_moxifloxacin", default: false
      t.integer "fluoroquinolones_moxifloxacin_s", limit: 2
      t.boolean "fluoroquinolones_ofloxacin", default: false
      t.integer "fluoroquinolones_ofloxacin_s", limit: 2
      t.boolean "fosfomycin", default: false
      t.integer "fosfomycin_s", limit: 2
      t.boolean "fucidanes", default: false
      t.integer "fucidanes_s", limit: 2
      t.boolean "glycopeptides", default: false
      t.boolean "glycopeptides_teicoplanin", default: false
      t.integer "glycopeptides_teicoplanin_s", limit: 2
      t.boolean "glycopeptides_telavancin", default: false
      t.integer "glycopeptides_telavancin_s", limit: 2
      t.boolean "glycopeptides_vancomycin", default: false
      t.integer "glycopeptides_vancomycin_s", limit: 2
      t.boolean "linezolid", default: false
      t.integer "linezolid_s", limit: 2
      t.boolean "monobactams", default: false
      t.integer "monobactams_s", limit: 2
      t.boolean "nitrofurantoin", default: false
      t.integer "nitrofurantoin_s", limit: 2
      t.boolean "penicillins", default: false
      t.boolean "penicillins_ampicillin", default: false
      t.boolean "penicillins_ampicillin_bli", default: false
      t.integer "penicillins_ampicillin_bli_s", limit: 2
      t.integer "penicillins_ampicillin_s", limit: 2
      t.boolean "penicillins_oxacillin", default: false
      t.integer "penicillins_oxacillin_s", limit: 2
      t.boolean "penicillins_piperacillin", default: false
      t.boolean "penicillins_piperacillin_bli", default: false
      t.integer "penicillins_piperacillin_bli_s", limit: 2
      t.integer "penicillins_piperacillin_s", limit: 2
      t.boolean "penicillins_ticarcillin", default: false
      t.integer "penicillins_ticarcillin_s", limit: 2
      t.boolean "phenicols", default: false
      t.integer "phenicols_s", limit: 2
      t.boolean "polymixins", default: false
      t.boolean "polymixins_colistins", default: false
      t.integer "polymixins_colistins_s", limit: 2
      t.boolean "polymixins_polymixin", default: false
      t.integer "polymixins_polymixin_s", limit: 2
      t.boolean "rifampin", default: false
      t.integer "rifampin_s", limit: 2
      t.boolean "tetracyclines", default: false
      t.boolean "tetracyclines_doxycyclin", default: false
      t.integer "tetracyclines_doxycyclin_s", limit: 2
      t.boolean "tetracyclines_glycylcylines", default: false
      t.integer "tetracyclines_glycylcylines_s", limit: 2
      t.boolean "tetracyclines_minocycline", default: false
      t.integer "tetracyclines_minocycline_s", limit: 2
      t.boolean "tetracyclines_tetracycline", default: false
      t.integer "tetracyclines_tetracycline_s", limit: 2
      t.boolean "trimethoprim", default: false
      t.integer "trimethoprim_s", limit: 2

      t.timestamps
    end
  end
end
