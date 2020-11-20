class CreateAppendixCultureResults < ActiveRecord::Migration[6.0]
  def change
    create_table :appendix_culture_results do |t|
      t.bigint "questionnaire_id"
      t.string "questionnaire_type", limit: 255

      t.bigint "pos_id"

      t.string "first_pathogen", limit: 255
      t.string "first_pathogen_specify", limit: 255
      t.bigint "first_pathogen_enter_cfu_ml"
      t.string "second_pathogen", limit: 255
      t.string "second_pathogen_specify", limit: 255
      t.bigint "second_pathogen_enter_cfu_ml"
      t.bigint "susceptibility_standard"
      t.string "susceptibility_standard_other_specify", limit: 255
      t.boolean "first_susceptibility_test_aminoglycosides"
      t.boolean "first_susceptibility_test_aminoglycosides_amikacin"
      t.integer "first_susceptibility_test_aminoglycosides_amikacin_s", limit: 2
      t.boolean "first_susceptibility_test_aminoglycosides_gentamicin"
      t.integer "first_susceptibility_test_aminoglycosides_gentamicin_s", limit: 2
      t.boolean "first_susceptibility_test_aminoglycosides_netilmicin"
      t.integer "first_susceptibility_test_aminoglycosides_netilmicin_s", limit: 2
      t.boolean "first_susceptibility_test_aminoglycosides_tobramicin"
      t.integer "first_susceptibility_test_aminoglycosides_tobramicin_s", limit: 2
      t.boolean "first_susceptibility_test_carbapenem"
      t.boolean "first_susceptibility_test_carbapenem_doripenem"
      t.integer "first_susceptibility_test_carbapenem_doripenem_s", limit: 2
      t.boolean "first_susceptibility_test_carbapenem_ertapenem"
      t.integer "first_susceptibility_test_carbapenem_ertapenem_s", limit: 2
      t.boolean "first_susceptibility_test_carbapenem_imipenem"
      t.integer "first_susceptibility_test_carbapenem_imipenem_s", limit: 2
      t.boolean "first_susceptibility_test_cephalosporins"
      t.boolean "first_susceptibility_test_cephalosporins_cefepime"
      t.integer "first_susceptibility_test_cephalosporins_cefepime_s", limit: 2
      t.boolean "first_susceptibility_test_cephalosporins_cefotaxime"
      t.integer "first_susceptibility_test_cephalosporins_cefotaxime_s", limit: 2
      t.boolean "first_susceptibility_test_cephalosporins_cefotetan"
      t.integer "first_susceptibility_test_cephalosporins_cefotetan_s", limit: 2
      t.boolean "first_susceptibility_test_cephalosporins_cefoxitin"
      t.integer "first_susceptibility_test_cephalosporins_cefoxitin_s", limit: 2
      t.boolean "first_susceptibility_test_cephalosporins_ceftaroline"
      t.integer "first_susceptibility_test_cephalosporins_ceftaroline_s", limit: 2
      t.boolean "first_susceptibility_test_cephalosporins_ceftazidime"
      t.integer "first_susceptibility_test_cephalosporins_ceftazidime_s", limit: 2
      t.boolean "first_susceptibility_test_cephalosporins_cefuroxime"
      t.integer "first_susceptibility_test_cephalosporins_cefuroxime_s", limit: 2
      t.boolean "first_susceptibility_test_cephalosporins_cephazolin"
      t.integer "first_susceptibility_test_cephalosporins_cephazolin_s", limit: 2
      t.boolean "first_susceptibility_test_clindamycin"
      t.integer "first_susceptibility_test_clindamycin_s", limit: 2
      t.boolean "first_susceptibility_test_daptomycin"
      t.integer "first_susceptibility_test_daptomycin_s", limit: 2
      t.boolean "first_susceptibility_test_erythromycin"
      t.integer "first_susceptibility_test_erythromycin_s", limit: 2
      t.boolean "first_susceptibility_test_fluoroquinolones"
      t.boolean "first_susceptibility_test_fluoroquinolones_ciprofloxacin"
      t.integer "first_susceptibility_test_fluoroquinolones_ciprofloxacin_s", limit: 2
      t.boolean "first_susceptibility_test_fluoroquinolones_levofloxacin"
      t.integer "first_susceptibility_test_fluoroquinolones_levofloxacin_s", limit: 2
      t.boolean "first_susceptibility_test_fluoroquinolones_moxifloxacin"
      t.integer "first_susceptibility_test_fluoroquinolones_moxifloxacin_s", limit: 2
      t.boolean "first_susceptibility_test_fluoroquinolones_ofloxacin"
      t.integer "first_susceptibility_test_fluoroquinolones_ofloxacin_s", limit: 2
      t.boolean "first_susceptibility_test_fosfomycin"
      t.integer "first_susceptibility_test_fosfomycin_s", limit: 2
      t.boolean "first_susceptibility_test_fucidanes"
      t.integer "first_susceptibility_test_fucidanes_s", limit: 2
      t.boolean "first_susceptibility_test_glycopeptides"
      t.boolean "first_susceptibility_test_glycopeptides_teicoplanin"
      t.integer "first_susceptibility_test_glycopeptides_teicoplanin_s", limit: 2
      t.boolean "first_susceptibility_test_glycopeptides_telavancin"
      t.integer "first_susceptibility_test_glycopeptides_telavancin_s", limit: 2
      t.boolean "first_susceptibility_test_glycopeptides_vancomycin"
      t.integer "first_susceptibility_test_glycopeptides_vancomycin_s", limit: 2
      t.boolean "first_susceptibility_test_linezolid"
      t.integer "first_susceptibility_test_linezolid_s", limit: 2
      t.boolean "first_susceptibility_test_monobactams"
      t.integer "first_susceptibility_test_monobactams_s", limit: 2
      t.boolean "first_susceptibility_test_nitrofurantoin"
      t.integer "first_susceptibility_test_nitrofurantoin_s", limit: 2
      t.boolean "first_susceptibility_test_penicillins"
      t.boolean "first_susceptibility_test_penicillins_ampicillin"
      t.boolean "first_susceptibility_test_penicillins_ampicillin_bli"
      t.integer "first_susceptibility_test_penicillins_ampicillin_bli_s", limit: 2
      t.integer "first_susceptibility_test_penicillins_ampicillin_s", limit: 2
      t.boolean "first_susceptibility_test_penicillins_oxacillin"
      t.integer "first_susceptibility_test_penicillins_oxacillin_s", limit: 2
      t.boolean "first_susceptibility_test_penicillins_piperacillin"
      t.boolean "first_susceptibility_test_penicillins_piperacillin_bli"
      t.integer "first_susceptibility_test_penicillins_piperacillin_bli_s", limit: 2
      t.integer "first_susceptibility_test_penicillins_piperacillin_s", limit: 2
      t.boolean "first_susceptibility_test_penicillins_ticarcillin"
      t.integer "first_susceptibility_test_penicillins_ticarcillin_s", limit: 2
      t.boolean "first_susceptibility_test_phenicols"
      t.integer "first_susceptibility_test_phenicols_s", limit: 2
      t.boolean "first_susceptibility_test_polymixins"
      t.boolean "first_susceptibility_test_polymixins_colistins"
      t.integer "first_susceptibility_test_polymixins_colistins_s", limit: 2
      t.boolean "first_susceptibility_test_polymixins_polymixin"
      t.integer "first_susceptibility_test_polymixins_polymixin_s", limit: 2
      t.boolean "first_susceptibility_test_rifampin"
      t.integer "first_susceptibility_test_rifampin_s", limit: 2
      t.boolean "first_susceptibility_test_tetracyclines"
      t.boolean "first_susceptibility_test_tetracyclines_doxycyclin"
      t.integer "first_susceptibility_test_tetracyclines_doxycyclin_s", limit: 2
      t.boolean "first_susceptibility_test_tetracyclines_glycylcylines"
      t.integer "first_susceptibility_test_tetracyclines_glycylcylines_s", limit: 2
      t.boolean "first_susceptibility_test_tetracyclines_minocycline"
      t.integer "first_susceptibility_test_tetracyclines_minocycline_s", limit: 2
      t.boolean "first_susceptibility_test_tetracyclines_tetracycline"
      t.integer "first_susceptibility_test_tetracyclines_tetracycline_s", limit: 2
      t.boolean "first_susceptibility_test_trimethoprim"
      t.integer "first_susceptibility_test_trimethoprim_s", limit: 2
      t.boolean "second_susceptibility_test_aminoglycosides"
      t.boolean "second_susceptibility_test_aminoglycosides_amikacin"
      t.integer "second_susceptibility_test_aminoglycosides_amikacin_s", limit: 2
      t.boolean "second_susceptibility_test_aminoglycosides_gentamicin"
      t.integer "second_susceptibility_test_aminoglycosides_gentamicin_s", limit: 2
      t.boolean "second_susceptibility_test_aminoglycosides_netilmicin"
      t.integer "second_susceptibility_test_aminoglycosides_netilmicin_s", limit: 2
      t.boolean "second_susceptibility_test_aminoglycosides_tobramicin"
      t.integer "second_susceptibility_test_aminoglycosides_tobramicin_s", limit: 2
      t.boolean "second_susceptibility_test_carbapenem"
      t.boolean "second_susceptibility_test_carbapenem_doripenem"
      t.integer "second_susceptibility_test_carbapenem_doripenem_s", limit: 2
      t.boolean "second_susceptibility_test_carbapenem_ertapenem"
      t.integer "second_susceptibility_test_carbapenem_ertapenem_s", limit: 2
      t.boolean "second_susceptibility_test_carbapenem_imipenem"
      t.integer "second_susceptibility_test_carbapenem_imipenem_s", limit: 2
      t.boolean "second_susceptibility_test_cephalosporins"
      t.boolean "second_susceptibility_test_cephalosporins_cefepime"
      t.integer "second_susceptibility_test_cephalosporins_cefepime_s", limit: 2
      t.boolean "second_susceptibility_test_cephalosporins_cefotaxime"
      t.integer "second_susceptibility_test_cephalosporins_cefotaxime_s", limit: 2
      t.boolean "second_susceptibility_test_cephalosporins_cefotetan"
      t.integer "second_susceptibility_test_cephalosporins_cefotetan_s", limit: 2
      t.boolean "second_susceptibility_test_cephalosporins_cefoxitin"
      t.integer "second_susceptibility_test_cephalosporins_cefoxitin_s", limit: 2
      t.boolean "second_susceptibility_test_cephalosporins_ceftaroline"
      t.integer "second_susceptibility_test_cephalosporins_ceftaroline_s", limit: 2
      t.boolean "second_susceptibility_test_cephalosporins_ceftazidime"
      t.integer "second_susceptibility_test_cephalosporins_ceftazidime_s", limit: 2
      t.boolean "second_susceptibility_test_cephalosporins_cefuroxime"
      t.integer "second_susceptibility_test_cephalosporins_cefuroxime_s", limit: 2
      t.boolean "second_susceptibility_test_cephalosporins_cephazolin"
      t.integer "second_susceptibility_test_cephalosporins_cephazolin_s", limit: 2
      t.boolean "second_susceptibility_test_clindamycin"
      t.integer "second_susceptibility_test_clindamycin_s", limit: 2
      t.boolean "second_susceptibility_test_daptomycin"
      t.integer "second_susceptibility_test_daptomycin_s", limit: 2
      t.boolean "second_susceptibility_test_erythromycin"
      t.integer "second_susceptibility_test_erythromycin_s", limit: 2
      t.boolean "second_susceptibility_test_fluoroquinolones"
      t.boolean "second_susceptibility_test_fluoroquinolones_ciprofloxacin"
      t.integer "second_susceptibility_test_fluoroquinolones_ciprofloxacin_s", limit: 2
      t.boolean "second_susceptibility_test_fluoroquinolones_levofloxacin"
      t.integer "second_susceptibility_test_fluoroquinolones_levofloxacin_s", limit: 2
      t.boolean "second_susceptibility_test_fluoroquinolones_moxifloxacin"
      t.integer "second_susceptibility_test_fluoroquinolones_moxifloxacin_s", limit: 2
      t.boolean "second_susceptibility_test_fluoroquinolones_ofloxacin"
      t.integer "second_susceptibility_test_fluoroquinolones_ofloxacin_s", limit: 2
      t.boolean "second_susceptibility_test_fosfomycin"
      t.integer "second_susceptibility_test_fosfomycin_s", limit: 2
      t.boolean "second_susceptibility_test_fucidanes"
      t.integer "second_susceptibility_test_fucidanes_s", limit: 2
      t.boolean "second_susceptibility_test_glycopeptides"
      t.boolean "second_susceptibility_test_glycopeptides_teicoplanin"
      t.integer "second_susceptibility_test_glycopeptides_teicoplanin_s", limit: 2
      t.boolean "second_susceptibility_test_glycopeptides_telavancin"
      t.integer "second_susceptibility_test_glycopeptides_telavancin_s", limit: 2
      t.boolean "second_susceptibility_test_glycopeptides_vancomycin"
      t.integer "second_susceptibility_test_glycopeptides_vancomycin_s", limit: 2
      t.boolean "second_susceptibility_test_linezolid"
      t.integer "second_susceptibility_test_linezolid_s", limit: 2
      t.boolean "second_susceptibility_test_monobactams"
      t.integer "second_susceptibility_test_monobactams_s", limit: 2
      t.boolean "second_susceptibility_test_nitrofurantoin"
      t.integer "second_susceptibility_test_nitrofurantoin_s", limit: 2
      t.boolean "second_susceptibility_test_penicillins"
      t.boolean "second_susceptibility_test_penicillins_ampicillin"
      t.boolean "second_susceptibility_test_penicillins_ampicillin_bli"
      t.integer "second_susceptibility_test_penicillins_ampicillin_bli_s", limit: 2
      t.integer "second_susceptibility_test_penicillins_ampicillin_s", limit: 2
      t.boolean "second_susceptibility_test_penicillins_oxacillin"
      t.integer "second_susceptibility_test_penicillins_oxacillin_s", limit: 2
      t.boolean "second_susceptibility_test_penicillins_piperacillin"
      t.boolean "second_susceptibility_test_penicillins_piperacillin_bli"
      t.integer "second_susceptibility_test_penicillins_piperacillin_bli_s", limit: 2
      t.integer "second_susceptibility_test_penicillins_piperacillin_s", limit: 2
      t.boolean "second_susceptibility_test_penicillins_ticarcillin"
      t.integer "second_susceptibility_test_penicillins_ticarcillin_s", limit: 2
      t.boolean "second_susceptibility_test_phenicols"
      t.integer "second_susceptibility_test_phenicols_s", limit: 2
      t.boolean "second_susceptibility_test_polymixins"
      t.boolean "second_susceptibility_test_polymixins_colistins"
      t.integer "second_susceptibility_test_polymixins_colistins_s", limit: 2
      t.boolean "second_susceptibility_test_polymixins_polymixin"
      t.integer "second_susceptibility_test_polymixins_polymixin_s", limit: 2
      t.boolean "second_susceptibility_test_rifampin"
      t.integer "second_susceptibility_test_rifampin_s", limit: 2
      t.boolean "second_susceptibility_test_tetracyclines"
      t.boolean "second_susceptibility_test_tetracyclines_doxycyclin"
      t.integer "second_susceptibility_test_tetracyclines_doxycyclin_s", limit: 2
      t.boolean "second_susceptibility_test_tetracyclines_glycylcylines"
      t.integer "second_susceptibility_test_tetracyclines_glycylcylines_s", limit: 2
      t.boolean "second_susceptibility_test_tetracyclines_minocycline"
      t.integer "second_susceptibility_test_tetracyclines_minocycline_s", limit: 2
      t.boolean "second_susceptibility_test_tetracyclines_tetracycline"
      t.integer "second_susceptibility_test_tetracyclines_tetracycline_s", limit: 2
      t.boolean "second_susceptibility_test_trimethoprim"
      t.integer "second_susceptibility_test_trimethoprim_s", limit: 2

      t.datetime "discarded_at"

      t.timestamps
    end
  end
end
