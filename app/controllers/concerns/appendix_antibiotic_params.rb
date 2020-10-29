module AppendixAntibioticParams
  extend ActiveSupport::Concern

  private

  def appendix_antibiotic_params
    [
      :pos_id,:id,
      :aminoglycosides_gentamicin,:aminoglycosides_amikacin,:aminoglycosides_other,:carbapenems_ertapenem,:carbapenems_imipenem,
      :carbapenems_doripenem,:carbapenems_meropenem,:first_generation_cephalosporins_cefadroxil,:first_generation_cephalosporins_cefazolin,
      :first_generation_cephalosporins_cefalexin,:second_generation_cephalosporins_cefaclor,:second_generation_cephalosporins_cefprozil,
      :second_generation_cephalosporins_cefuroxime,:third_generation_cephalosporins_cefixim,:third_generation_cephalosporins_cefdinir,
      :third_generation_cephalosporins_cefotaxime,:third_generation_cephalosporins_cefpodoxime,:third_generation_cephalosporins_ceftazidime,
      :third_generation_cephalosporins_ceftibuten,:third_generation_cephalosporins_ceftriaxone,:fourth_generation_cephalosporins_cefepime,
      :fifth_generation_cephalosporins_ceftaroline_fosamil,:fifth_generation_cephalosporins_ceftobiprole,:glycopeptides_teicoplanin,
      :glycopeptides_vancomycin,:glycopeptides_telavancin,:lincosamides_clindamycin,:lincosamides_lincomycin,
      :macrolides, :macrolides_azithromycin, :macrolides_clarithromycin, :macrolides_erythromycin, :macrolides_roxithromycin, :macrolides_telithromycin, :macrolides_spiramycin,
      :monobactams_aztreonam,:nitrofurans_furazolidine,:nitrofurans_nitrofurantoin,:penicillins_amoxicillin,
      :penicillins_ampicillin,:penicillins_nafcillin,:penicillins_oxacillin,:penicillins_ticarcillin,:penicillins_penicillin_g,
      :penicillins_methicillin,:penicillins_penicillin_combinations,:penicillins_penicillin_combinations_amoxicillin_clavulunate,
      :penicillins_penicillin_combinations_ampicillin_sulbactam,:penicillins_penicillin_combinations_piperacillin_tazobactam,
      :penicillins_penicillin_combinations_ticarcillin_claculunate,:polypeptides_bacitracin,:polypeptides_colistin,:polypeptides_polymyxin_b,
      :quinolones_ciprofloxacin,:quinolones_enoxacin,:quinolones_gatifloxacin,:quinolones_gemifloxacin,:quinolones_levofloxacin,
      :quinolones_lomefloxacin,:quinolones_moxifloxacin,:quinolones_nalidixic_acid,:quinolones_norfloxacin,:quinolones_ofloxacin,
      :sulfonamides_sulfamethoxazole,:sulfonamides_trimephtoprim_sulfamethoxazole,:tetracyclines_doxycycline,:tetracyclines_tetracycline,
      :antimycobacterial_drugs_clofazimine,:antimycobacterial_drugs_dapsone,:antimycobacterial_drugs_capreomycin,
      :antimycobacterial_drugs_cycloserine,:antimycobacterial_drugs_ethembutol,:antimycobacterial_drugs_ethionamide,
      :antimycobacterial_drugs_isoniazid,:antimycobacterial_drugs_pyranizamide,:antimycobacterial_drugs_rifampicin,:antimycobacterial_drugs_streptomycin,
      :others_chloramphenicol,:others_fosfomycin,:others_metronidazole,:others_trimethoprim,
      :aminoglycosides, :carbapenems, :first_generation_cephalosporins, :second_generation_cephalosporins, :third_generation_cephalosporins,
      :fourth_generation_cephalosporins, :fifth_generation_cephalosporins, :glycopeptides, :lincosamides, :monobactams, :nitrofurans,
      :penicillins, :polypeptides, :quinolones, :sulfonamides, :tetracyclines, :antimycobacterial_drugs, :others,
      antibiotic_appendix_regimens_attributes: [:pos_id, :id, :unit, :dosage, :regimen_day, :regimen_each]
    ]
  end
end
