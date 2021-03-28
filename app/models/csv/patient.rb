class Csv::Patient < Csv::Writer
  def row(p)
    col 'ID',        p.id
    col 'Initial',   p.initial
    col 'Department ID', p.department.id
    col 'Hospital ID', p.department.hospital.id
    #col 'State', p.state
    col 'Locked', p.locked
    col 'Study Iteration ID', p.study_iteration_id

    if p.uti_ssi?
      # Patient identification
      col 'include.1.ii', p.patient_identification.birth_year
      col 'include.1.iii', p.patient_identification.sex
      col 'include.1.iii.b.1.', p.patient_identification.pregnancy
      col 'include.1.iv', p.patient_identification.admission_date
      col 'include.1.v', p.patient_identification.evidence_infection
      col 'include.1.v.a.1', p.patient_identification.admission_infection
      col 'include.1.vi', p.patient_identification.infection_type

      # Patient UTI
      col 'uti.1.i.a', p.uti_questionnaire.appendix_comorbidity&.myocardialinfarction
      col 'uti.1.i.b', p.uti_questionnaire.appendix_comorbidity&.congestiveheartfailure
      col 'uti.1.i.c', p.uti_questionnaire.appendix_comorbidity&.vasculardisease
      col 'uti.1.i.d', p.uti_questionnaire.appendix_comorbidity&.cerebrovascular
      col 'uti.1.i.e', p.uti_questionnaire.appendix_comorbidity&.dementia
      col 'uti.1.i.f', p.uti_questionnaire.appendix_comorbidity&.pulmonary
      col 'uti.1.i.g', p.uti_questionnaire.appendix_comorbidity&.tissuedisease
      col 'uti.1.i.h', p.uti_questionnaire.appendix_comorbidity&.ulcerdisease
      col 'uti.1.i.i', p.uti_questionnaire.appendix_comorbidity&.mildliver
      col 'uti.1.i.j', p.uti_questionnaire.appendix_comorbidity&.diabetes
      col 'uti.1.ii.a', p.uti_questionnaire.appendix_comorbidity&.hemiplegia
      col 'uti.1.ii.b', p.uti_questionnaire.appendix_comorbidity&.renaldisease
      col 'uti.1.ii.c', p.uti_questionnaire.appendix_comorbidity&.diabetesorgandamage
      col 'uti.1.ii.d', p.uti_questionnaire.appendix_comorbidity&.tumor
      col 'uti.1.ii.e', p.uti_questionnaire.appendix_comorbidity&.leukaemia
      col 'uti.1.ii.f', p.uti_questionnaire.appendix_comorbidity&.lymphoma
      col 'uti.1.iii.a', p.uti_questionnaire.appendix_comorbidity&.severeliverdamage
      col 'uti.1.iv.a', p.uti_questionnaire.appendix_comorbidity&.metastatictumor
      col 'uti.1.iv.b', p.uti_questionnaire.appendix_comorbidity&.aids
      col 'uti.2.i', p.uti_questionnaire.previous
      col 'uti.2.ii', p.uti_questionnaire.tractobstruction
      col 'uti.2.ii.a.1', p.uti_questionnaire.tractobjstructionspecify
      col 'uti.2.iii.a', p.uti_questionnaire.urinarystones_calyceal
      col 'uti.2.iii.b', p.uti_questionnaire.urinarystones_renalpelvic
      col 'uti.2.iii.c', p.uti_questionnaire.urinarystones_ureteral
      col 'uti.2.iii.d', p.uti_questionnaire.urinarystones_bladder
      col 'uti.2.iv', p.uti_questionnaire.treatment
      col 'uti.2.iv.a.1', p.uti_questionnaire.treatmentspecify
      col 'uti.2.v', p.uti_questionnaire.hospitalisation
      col 'uti.2.vi.a', p.uti_questionnaire.catheter_urethral
      col 'uti.2.vi.b', p.uti_questionnaire.catheter_suprapubic
      col 'uti.2.vi.c', p.uti_questionnaire.catheter_ureteralstent
      col 'uti.2.vi.d', p.uti_questionnaire.catheter_nephrostomy
      col 'uti.2.vi.e', p.uti_questionnaire.catheter_others
      col 'uti.2.vii', p.uti_questionnaire.catheterduration
      col 'uti.3.i', p.uti_questionnaire.intervention_endoscopic
      col 'uti.3.ii', p.uti_questionnaire.intervention_percutaneous
      col 'uti.3.iii', p.uti_questionnaire.intervention_laparoscopic
      col 'uti.3.iv', p.uti_questionnaire.intervention_opensurgery
      # UTI
      col 'uti.3.v', p.uti_questionnaire.protatebiopsy

      col 'uti.3.vi', p.uti_questionnaire.intervention_others
      col 'uti.3.vii', p.uti_questionnaire.intervention_contamination
      col 'uti.4.i', p.uti_questionnaire.diagnosedate
      col 'uti.4.ii', p.uti_questionnaire.clinicaldiagnosis
      col 'uti.4.ii.g.1', p.uti_questionnaire.clinicaldiagnosisspecify

      # UTI
      col 'uti.4.iii.a', p.uti_questionnaire.symptomaticutiandbacteriuria
      col 'uti.4.iii.b', p.uti_questionnaire.symptomaticutiandother
      col 'uti.4.iii.c', p.uti_questionnaire.asymptomaticbactcath
      col 'uti.4.iii.d', p.uti_questionnaire.asymptomaticbactnocath
      col 'uti.4.iii.e', p.uti_questionnaire.otheruti

      col 'uti.5.i', p.uti_questionnaire.provennauti
      col 'uti.5.i.1', p.uti_questionnaire.culturetissue_urine
      col 'uti.5.i.2', p.uti_questionnaire.culturetissue_blood
      col 'uti.5.i.3', p.uti_questionnaire.culturetissue_fluidswab
      col 'uti.5.i.4', p.uti_questionnaire.culturetissue_other
      col 'uti.5.i.4.i', p.uti_questionnaire.culturetissue_specify
      col 'uti.5.ii', p.uti_questionnaire.antibioticculture

      col 'uti.5.ii.a.1', !p.uti_questionnaire.get_appendix_antibiotics_at(0).aminoglycoside.nil?
      col 'uti.5.ii.a.1.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).aminoglycoside_gentamicin?
      col 'uti.5.ii.a.1.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).aminoglycoside_amikacin?
      col 'uti.5.ii.a.1.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).aminoglycoside_other?

      col 'uti.5.ii.a.2', !p.uti_questionnaire.get_appendix_antibiotics_at(0).carbapenem.nil?
      col 'uti.5.ii.a.2.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).carbapenem_ertapenem?
      col 'uti.5.ii.a.2.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).carbapenem_imipenem?
      col 'uti.5.ii.a.2.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).carbapenem_doripenem?
      col 'uti.5.ii.a.2.iv', p.uti_questionnaire.get_appendix_antibiotics_at(0).carbapenem_meropenem?

      col 'uti.5.ii.a.3', !p.uti_questionnaire.get_appendix_antibiotics_at(0).first_generation_cephalosporin.nil?
      col 'uti.5.ii.a.3.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).first_generation_cephalosporin_cefadroxil?
      col 'uti.5.ii.a.3.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).first_generation_cephalosporin_cefazolin?
      col 'uti.5.ii.a.3.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).first_generation_cephalosporin_cefalexin?

      col 'uti.5.ii.a.4', !p.uti_questionnaire.get_appendix_antibiotics_at(0).second_generation_cephalosporin.nil?
      col 'uti.5.ii.a.4.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).second_generation_cephalosporin_cefaclor?
      col 'uti.5.ii.a.4.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).second_generation_cephalosporin_cefprozil?
      col 'uti.5.ii.a.4.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).second_generation_cephalosporin_cefuroxime?

      col 'uti.5.ii.a.5', !p.uti_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin.nil?
      col 'uti.5.ii.a.5.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_cefixim?
      col 'uti.5.ii.a.5.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_cefdinir?
      col 'uti.5.ii.a.5.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_cefotaxime?
      col 'uti.5.ii.a.5.iv', p.uti_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_cefpodoxime?
      col 'uti.5.ii.a.5.v', p.uti_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_ceftazidime?
      col 'uti.5.ii.a.5.vi', p.uti_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_ceftibuten?
      col 'uti.5.ii.a.5.vii', p.uti_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_ceftriaxone?

      col 'uti.5.ii.a.6', !p.uti_questionnaire.get_appendix_antibiotics_at(0).fourth_generation_cephalosporin.nil?
      col 'uti.5.ii.a.6.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).fourth_generation_cephalosporin_cefepime?

      col 'uti.5.ii.a.7', !p.uti_questionnaire.get_appendix_antibiotics_at(0).fifth_generation_cephalosporin.nil?
      col 'uti.5.ii.a.7.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).fifth_generation_cephalosporin_ceftaroline_fosamil?
      col 'uti.5.ii.a.7.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).fifth_generation_cephalosporin_ceftobiprole?

      col 'uti.5.ii.a.8', !p.uti_questionnaire.get_appendix_antibiotics_at(0).glycopeptide.nil?
      col 'uti.5.ii.a.8.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).glycopeptide_teicoplanin?
      col 'uti.5.ii.a.8.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).glycopeptide_vancomycin?
      col 'uti.5.ii.a.8.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).glycopeptide_telavancin?

      col 'uti.5.ii.a.9', !p.uti_questionnaire.get_appendix_antibiotics_at(0).lincosamide.nil?
      col 'uti.5.ii.a.9.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).lincosamide_clindamycin?
      col 'uti.5.ii.a.9.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).lincosamide_lincomycin?

      col 'uti.5.ii.a.10', !p.uti_questionnaire.get_appendix_antibiotics_at(0).macrolide.nil?
      col 'uti.5.ii.a.10.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).macrolide_azithromycin?
      col 'uti.5.ii.a.10.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).macrolide_clarithromycin?
      col 'uti.5.ii.a.10.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).macrolide_erythromycin?
      col 'uti.5.ii.a.10.iv', p.uti_questionnaire.get_appendix_antibiotics_at(0).macrolide_roxithromycin?
      col 'uti.5.ii.a.10.v', p.uti_questionnaire.get_appendix_antibiotics_at(0).macrolide_telithromycin?
      col 'uti.5.ii.a.10.vi', p.uti_questionnaire.get_appendix_antibiotics_at(0).macrolide_spiramycin?

      col 'uti.5.ii.a.11', !p.uti_questionnaire.get_appendix_antibiotics_at(0).monobactam.nil?
      col 'uti.5.ii.a.11.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).monobactam_aztreonam?

      col 'uti.5.ii.a.12', !p.uti_questionnaire.get_appendix_antibiotics_at(0).nitrofuran.nil?
      col 'uti.5.ii.a.12.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).nitrofuran_furazolidine?
      col 'uti.5.ii.a.12.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).nitrofuran_nitrofurantoin?

      col 'uti.5.ii.a.13', !p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin.nil?
      col 'uti.5.ii.a.13.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_amoxicillin?
      col 'uti.5.ii.a.13.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_ampicillin?
      col 'uti.5.ii.a.13.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_nafcillin?
      col 'uti.5.ii.a.13.iv', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_oxacillin?
      col 'uti.5.ii.a.13.v', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_ticarcillin?
      col 'uti.5.ii.a.13.vi', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_penicillin_g?
      col 'uti.5.ii.a.13.vii', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_methicillin?
      #col 'uti.5.ii.a.13.viii', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillins_penicillin_combinations
      col 'uti.5.ii.a.13.viii.a', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_amoxicillin_clavulunate?
      col 'uti.5.ii.a.13.viii.b', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_ampicillin_sulbactam?
      col 'uti.5.ii.a.13.viii.c', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_piperacillin_tazobactam?
      col 'uti.5.ii.a.13.viii.d', p.uti_questionnaire.get_appendix_antibiotics_at(0).penicillin_ticarcillin_claculunate?

      col 'uti.5.ii.a.14', !p.uti_questionnaire.get_appendix_antibiotics_at(0).polypeptide.nil?
      col 'uti.5.ii.a.14.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).polypeptide_bacitracin?
      col 'uti.5.ii.a.14.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).polypeptide_colistin?
      col 'uti.5.ii.a.14.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).polypeptide_polymyxin_b?

      col 'uti.5.ii.a.15', !p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone.nil?
      col 'uti.5.ii.a.15.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_ciprofloxacin?
      col 'uti.5.ii.a.15.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_enoxacin?
      col 'uti.5.ii.a.15.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_gatifloxacin?
      col 'uti.5.ii.a.15.iv', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_gemifloxacin?
      col 'uti.5.ii.a.15.v', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_levofloxacin?
      col 'uti.5.ii.a.15.vi', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_lomefloxacin?
      col 'uti.5.ii.a.15.vii', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_moxifloxacin?
      col 'uti.5.ii.a.15.viii', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_nalidixic_acid?
      col 'uti.5.ii.a.15.ix', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_norfloxacin?
      col 'uti.5.ii.a.15.x', p.uti_questionnaire.get_appendix_antibiotics_at(0).quinolone_ofloxacin?

      col 'uti.5.ii.a.16', !p.uti_questionnaire.get_appendix_antibiotics_at(0).sulfonamide.nil?
      col 'uti.5.ii.a.16.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).sulfonamide_sulfamethoxazole?
      col 'uti.5.ii.a.16.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).sulfonamide_trimephtoprim_sulfamethoxazole?

      col 'uti.5.ii.a.17', !p.uti_questionnaire.get_appendix_antibiotics_at(0).tetracycline.nil?
      col 'uti.5.ii.a.17.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).tetracycline_doxycycline?
      col 'uti.5.ii.a.17.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).tetracycline_tetracycline?

      col 'uti.5.ii.a.18', !p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug.nil?
      col 'uti.5.ii.a.18.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_clofazimine?
      col 'uti.5.ii.a.18.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_dapsone?
      col 'uti.5.ii.a.18.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_capreomycin?
      col 'uti.5.ii.a.18.iv', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_cycloserine?
      col 'uti.5.ii.a.18.v', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_ethembutol?
      col 'uti.5.ii.a.18.vi', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_ethionamide?
      col 'uti.5.ii.a.18.vii', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_isoniazid?
      col 'uti.5.ii.a.18.viii', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_pyranizamide?
      col 'uti.5.ii.a.18.ix', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_rifampicin?
      col 'uti.5.ii.a.18.x', p.uti_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_streptomycin?

      col 'uti.5.ii.a.19', !p.uti_questionnaire.get_appendix_antibiotics_at(0).other.nil?
      col 'uti.5.ii.a.19.i', p.uti_questionnaire.get_appendix_antibiotics_at(0).other_chloramphenicol?
      col 'uti.5.ii.a.19.ii', p.uti_questionnaire.get_appendix_antibiotics_at(0).other_fosfomycin?
      col 'uti.5.ii.a.19.iii', p.uti_questionnaire.get_appendix_antibiotics_at(0).other_metronidazole?
      col 'uti.5.ii.a.19.iv', p.uti_questionnaire.get_appendix_antibiotics_at(0).other_trimethoprim?

      col 'uti.5.iii.a.1', p.uti_questionnaire.appendix_culture_result&.first_pathogen
      col 'uti.5.iii.a.1_specify', p.uti_questionnaire.appendix_culture_result&.first_pathogen_specify
      col 'uti.5.iii.a.2', p.uti_questionnaire.appendix_culture_result&.first_pathogen_enter_cfu_ml
      col 'uti.5.iii.a.3.i', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins
      col 'uti.5.iii.a.3.i.a', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin
      col 'uti.5.iii.a.3.i.a_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_s
      col 'uti.5.iii.a.3.i.b', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_bli
      col 'uti.5.iii.a.3.i.b_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_bli_s
      col 'uti.5.iii.a.3.i.c', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin
      col 'uti.5.iii.a.3.i.c_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_s
      col 'uti.5.iii.a.3.i.d', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_bli
      col 'uti.5.iii.a.3.i.d_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_bli_s
      col 'uti.5.iii.a.3.i.e', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_oxacillin
      col 'uti.5.iii.a.3.i.e_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_oxacillin_s
      col 'uti.5.iii.a.3.i.f', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ticarcillin
      col 'uti.5.iii.a.3.i.f_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ticarcillin_s
      col 'uti.5.iii.a.3.ii', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins
      col 'uti.5.iii.a.3.ii.a', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cephazolin
      col 'uti.5.iii.a.3.ii.a_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cephazolin_s
      col 'uti.5.iii.a.3.ii.b', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefuroxime
      col 'uti.5.iii.a.3.ii.b_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefuroxime_s
      col 'uti.5.iii.a.3.ii.c', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotaxime
      col 'uti.5.iii.a.3.ii.c_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotaxime_s
      col 'uti.5.iii.a.3.ii.d', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftazidime
      col 'uti.5.iii.a.3.ii.d_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftazidime_s
      col 'uti.5.iii.a.3.ii.e', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefepime
      col 'uti.5.iii.a.3.ii.e_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefepime_s
      col 'uti.5.iii.a.3.ii.f', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftaroline
      col 'uti.5.iii.a.3.ii.f_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftaroline_s
      col 'uti.5.iii.a.3.ii.g.1', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefoxitin
      col 'uti.5.iii.a.3.ii.g.1_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefoxitin_s
      col 'uti.5.iii.a.3.ii.g.2', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotetan
      col 'uti.5.iii.a.3.ii.g.2_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotetan_s
      col 'uti.5.iii.a.3.iii', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem
      col 'uti.5.iii.a.3.iii.a', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_imipenem
      col 'uti.5.iii.a.3.iii.a_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_imipenem_s
      col 'uti.5.iii.a.3.iii.b', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_doripenem
      col 'uti.5.iii.a.3.iii.b_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_doripenem_s
      col 'uti.5.iii.a.3.iii.c', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_ertapenem
      col 'uti.5.iii.a.3.iii.c_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_ertapenem_s
      col 'uti.5.iii.a.3.iv', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides
      col 'uti.5.iii.a.3.iv.a', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_gentamicin
      col 'uti.5.iii.a.3.iv.a_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_gentamicin_s
      col 'uti.5.iii.a.3.iv.b', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_amikacin
      col 'uti.5.iii.a.3.iv.b_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_amikacin_s
      col 'uti.5.iii.a.3.iv.c', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_tobramicin
      col 'uti.5.iii.a.3.iv.c_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_tobramicin_s
      col 'uti.5.iii.a.3.iv.d', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_netilmicin
      col 'uti.5.iii.a.3.iv.d_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_netilmicin_s
      col 'uti.5.iii.a.3.v', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones
      col 'uti.5.iii.a.3.v.a', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ofloxacin
      col 'uti.5.iii.a.3.v.a_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ofloxacin_s
      col 'uti.5.iii.a.3.v.b', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ciprofloxacin
      col 'uti.5.iii.a.3.v.b_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ciprofloxacin_s
      col 'uti.5.iii.a.3.v.c', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_levofloxacin
      col 'uti.5.iii.a.3.v.c_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_levofloxacin_s
      col 'uti.5.iii.a.3.v.d', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_moxifloxacin
      col 'uti.5.iii.a.3.v.d_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_moxifloxacin_s
      col 'uti.5.iii.a.3.vi', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines
      col 'uti.5.iii.a.3.vi.a', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_doxycyclin
      col 'uti.5.iii.a.3.vi.a_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_doxycyclin_s
      col 'uti.5.iii.a.3.vi.b', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_tetracycline
      col 'uti.5.iii.a.3.vi.b_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_tetracycline_s
      col 'uti.5.iii.a.3.vi.c', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_minocycline
      col 'uti.5.iii.a.3.vi.c_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_minocycline_s
      col 'uti.5.iii.a.3.vi.d', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_glycylcylines
      col 'uti.5.iii.a.3.vi.d_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_glycylcylines_s
      col 'uti.5.iii.a.3.vii', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fosfomycin
      col 'uti.5.iii.a.3.vii_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fosfomycin_s
      col 'uti.5.iii.a.3.viii', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_trimethoprim
      col 'uti.5.iii.a.3.viii_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_trimethoprim_s
      col 'uti.5.iii.a.3.ix', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_nitrofurantoin
      col 'uti.5.iii.a.3.ix_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_nitrofurantoin_s
      col 'uti.5.iii.a.3.x', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_erythromycin
      col 'uti.5.iii.a.3.x_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_erythromycin_s
      col 'uti.5.iii.a.3.xi', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_clindamycin
      col 'uti.5.iii.a.3.xi_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_clindamycin_s
      col 'uti.5.iii.a.3.xii', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides
      col 'uti.5.iii.a.3.xii.a', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_vancomycin
      col 'uti.5.iii.a.3.xii.a_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_vancomycin_s
      col 'uti.5.iii.a.3.xii.b', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_teicoplanin
      col 'uti.5.iii.a.3.xii.b_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_teicoplanin_s
      col 'uti.5.iii.a.3.xii.c', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_telavancin
      col 'uti.5.iii.a.3.xii.c_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_telavancin_s
      col 'uti.5.iii.a.3.xiii', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_linezolid
      col 'uti.5.iii.a.3.xiii_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_linezolid_s
      col 'uti.5.iii.a.3.xiv', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_phenicols
      col 'uti.5.iii.a.3.xiv_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_phenicols_s
      col 'uti.5.iii.a.3.xv', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins
      col 'uti.5.iii.a.3.xv.a', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_colistins
      col 'uti.5.iii.a.3.xv.a_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_colistins_s
      col 'uti.5.iii.a.3.xv.b', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_polymixin
      col 'uti.5.iii.a.3.xv.b_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_polymixin_s
      col 'uti.5.iii.a.3.xvi', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_monobactams
      col 'uti.5.iii.a.3.xvi_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_monobactams_s
      col 'uti.5.iii.a.3.xvii', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_daptomycin
      col 'uti.5.iii.a.3.xvii_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_daptomycin_s
      col 'uti.5.iii.a.3.xviii', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_rifampin
      col 'uti.5.iii.a.3.xviii_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_rifampin_s
      col 'uti.5.iii.a.3.xix', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fucidanes
      col 'uti.5.iii.a.3.xix_s', p.uti_questionnaire.appendix_culture_result&.first_susceptibility_test_fucidanes_s
      col 'uti.5.iii.b.1', p.uti_questionnaire.appendix_culture_result&.second_pathogen
      col 'uti.5.iii.b.1_specify', p.uti_questionnaire.appendix_culture_result&.second_pathogen_specify
      col 'uti.5.iii.b.2', p.uti_questionnaire.appendix_culture_result&.second_pathogen_enter_cfu_ml
      col 'uti.5.iii.b.3.i', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins
      col 'uti.5.iii.b.3.i.a', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin
      col 'uti.5.iii.b.3.i.a_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_s
      col 'uti.5.iii.b.3.i.b', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_bli
      col 'uti.5.iii.b.3.i.b_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_bli_s
      col 'uti.5.iii.b.3.i.c', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin
      col 'uti.5.iii.b.3.i.c_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_s
      col 'uti.5.iii.b.3.i.d', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_bli
      col 'uti.5.iii.b.3.i.d_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_bli_s
      col 'uti.5.iii.b.3.i.e', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_oxacillin
      col 'uti.5.iii.b.3.i.e_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_oxacillin_s
      col 'uti.5.iii.b.3.i.f', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ticarcillin
      col 'uti.5.iii.b.3.i.f_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ticarcillin_s
      col 'uti.5.iii.b.3.ii', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins
      col 'uti.5.iii.b.3.ii.a', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cephazolin
      col 'uti.5.iii.b.3.ii.a_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cephazolin_s
      col 'uti.5.iii.b.3.ii.b', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefuroxime
      col 'uti.5.iii.b.3.ii.b_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefuroxime_s
      col 'uti.5.iii.b.3.ii.c', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotaxime
      col 'uti.5.iii.b.3.ii.c_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotaxime_s
      col 'uti.5.iii.b.3.ii.d', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftazidime
      col 'uti.5.iii.b.3.ii.d_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftazidime_s
      col 'uti.5.iii.b.3.ii.e', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefepime
      col 'uti.5.iii.b.3.ii.e_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefepime_s
      col 'uti.5.iii.b.3.ii.f', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftaroline
      col 'uti.5.iii.b.3.ii.f_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftaroline_s
      col 'uti.5.iii.b.3.ii.g.1', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefoxitin
      col 'uti.5.iii.b.3.ii.g.1_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefoxitin_s
      col 'uti.5.iii.b.3.ii.g.2', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotetan
      col 'uti.5.iii.b.3.ii.g.2_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotetan_s
      col 'uti.5.iii.b.3.iii', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem
      col 'uti.5.iii.b.3.iii.a', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_imipenem
      col 'uti.5.iii.b.3.iii.a_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_imipenem_s
      col 'uti.5.iii.b.3.iii.b', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_doripenem
      col 'uti.5.iii.b.3.iii.b_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_doripenem_s
      col 'uti.5.iii.b.3.iii.c', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_ertapenem
      col 'uti.5.iii.b.3.iii.c_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_ertapenem_s
      col 'uti.5.iii.b.3.iv', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides
      col 'uti.5.iii.b.3.iv.a', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_gentamicin
      col 'uti.5.iii.b.3.iv.a_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_gentamicin_s
      col 'uti.5.iii.b.3.iv.b', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_amikacin
      col 'uti.5.iii.b.3.iv.b_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_amikacin_s
      col 'uti.5.iii.b.3.iv.c', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_tobramicin
      col 'uti.5.iii.b.3.iv.c_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_tobramicin_s
      col 'uti.5.iii.b.3.iv.d', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_netilmicin
      col 'uti.5.iii.b.3.iv.d_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_netilmicin_s
      col 'uti.5.iii.b.3.v', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones
      col 'uti.5.iii.b.3.v.a', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ofloxacin
      col 'uti.5.iii.b.3.v.a_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ofloxacin_s
      col 'uti.5.iii.b.3.v.b', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ciprofloxacin
      col 'uti.5.iii.b.3.v.b_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ciprofloxacin_s
      col 'uti.5.iii.b.3.v.c', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_levofloxacin
      col 'uti.5.iii.b.3.v.c_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_levofloxacin_s
      col 'uti.5.iii.b.3.v.d', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_moxifloxacin
      col 'uti.5.iii.b.3.v.d_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_moxifloxacin_s
      col 'uti.5.iii.b.3.vi', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines
      col 'uti.5.iii.b.3.vi.a', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_doxycyclin
      col 'uti.5.iii.b.3.vi.a_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_doxycyclin_s
      col 'uti.5.iii.b.3.vi.b', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_tetracycline
      col 'uti.5.iii.b.3.vi.b_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_tetracycline_s
      col 'uti.5.iii.b.3.vi.c', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_minocycline
      col 'uti.5.iii.b.3.vi.c_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_minocycline_s
      col 'uti.5.iii.b.3.vi.d', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_glycylcylines
      col 'uti.5.iii.b.3.vi.d_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_glycylcylines_s
      col 'uti.5.iii.b.3.vii', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fosfomycin
      col 'uti.5.iii.b.3.vii_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fosfomycin_s
      col 'uti.5.iii.b.3.viii', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_trimethoprim
      col 'uti.5.iii.b.3.viii_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_trimethoprim_s
      col 'uti.5.iii.b.3.ix', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_nitrofurantoin
      col 'uti.5.iii.b.3.ix_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_nitrofurantoin_s
      col 'uti.5.iii.b.3.x', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_erythromycin
      col 'uti.5.iii.b.3.x_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_erythromycin_s
      col 'uti.5.iii.b.3.xi', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_clindamycin
      col 'uti.5.iii.b.3.xi_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_clindamycin_s
      col 'uti.5.iii.b.3.xii', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides
      col 'uti.5.iii.b.3.xii.a', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_vancomycin
      col 'uti.5.iii.b.3.xii.a_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_vancomycin_s
      col 'uti.5.iii.b.3.xii.b', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_teicoplanin
      col 'uti.5.iii.b.3.xii.b_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_teicoplanin_s
      col 'uti.5.iii.b.3.xii.c', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_telavancin
      col 'uti.5.iii.b.3.xii.c_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_telavancin_s
      col 'uti.5.iii.b.3.xiii', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_linezolid
      col 'uti.5.iii.b.3.xiii_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_linezolid_s
      col 'uti.5.iii.b.3.xiv', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_phenicols
      col 'uti.5.iii.b.3.xiv_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_phenicols_s
      col 'uti.5.iii.b.3.xv', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins
      col 'uti.5.iii.b.3.xv.a', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_colistins
      col 'uti.5.iii.b.3.xv.a_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_colistins_s
      col 'uti.5.iii.b.3.xv.b', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_polymixin
      col 'uti.5.iii.b.3.xv.b_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_polymixin_s
      col 'uti.5.iii.b.3.xvi', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_monobactams
      col 'uti.5.iii.b.3.xvi_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_monobactams_s
      col 'uti.5.iii.b.3.xvii', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_daptomycin
      col 'uti.5.iii.b.3.xvii_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_daptomycin_s
      col 'uti.5.iii.b.3.xviii', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_rifampin
      col 'uti.5.iii.b.3.xviii_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_rifampin_s
      col 'uti.5.iii.b.3.xix', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fucidanes
      col 'uti.5.iii.b.3.xix_s', p.uti_questionnaire.appendix_culture_result&.second_susceptibility_test_fucidanes_s

      col 'uti.6.ii.a.1', !p.uti_questionnaire.get_appendix_antibiotics_at(1).aminoglycoside.nil?
      col 'uti.6.ii.a.1.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).aminoglycoside_gentamicin?
      col 'uti.6.ii.a.1.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).aminoglycoside_amikacin?
      col 'uti.6.ii.a.1.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).aminoglycoside_other?

      col 'uti.6.ii.a.2', !p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenem.nil?
      col 'uti.6.ii.a.2.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenem_ertapenem?
      col 'uti.6.ii.a.2.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenem_imipenem?
      col 'uti.6.ii.a.2.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenem_doripenem?
      col 'uti.6.ii.a.2.iv', p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenem_meropenem?

      col 'uti.6.ii.a.3', !p.uti_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporin.nil?
      col 'uti.6.ii.a.3.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporin_cefadroxil?
      col 'uti.6.ii.a.3.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporin_cefazolin?
      col 'uti.6.ii.a.3.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporin_cefalexin?

      col 'uti.6.ii.a.4', !p.uti_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporin.nil?
      col 'uti.6.ii.a.4.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporin_cefaclor?
      col 'uti.6.ii.a.4.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporin_cefprozil?
      col 'uti.6.ii.a.4.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporin_cefuroxime?

      col 'uti.6.ii.a.5', !p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin.nil?
      col 'uti.6.ii.a.5.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_cefixim?
      col 'uti.6.ii.a.5.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_cefdinir?
      col 'uti.6.ii.a.5.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_cefotaxime?
      col 'uti.6.ii.a.5.iv', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_cefpodoxime?
      col 'uti.6.ii.a.5.v', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_ceftazidime?
      col 'uti.6.ii.a.5.vi', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_ceftibuten?
      col 'uti.6.ii.a.5.vii', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_ceftriaxone?

      col 'uti.6.ii.a.6', !p.uti_questionnaire.get_appendix_antibiotics_at(1).fourth_generation_cephalosporin.nil?
      col 'uti.6.ii.a.6.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).fourth_generation_cephalosporin_cefepime?

      col 'uti.6.ii.a.7', !p.uti_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporin.nil?
      col 'uti.6.ii.a.7.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporin_ceftaroline_fosamil?
      col 'uti.6.ii.a.7.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporin_ceftobiprole?

      col 'uti.6.ii.a.8', !p.uti_questionnaire.get_appendix_antibiotics_at(1).glycopeptide.nil?
      col 'uti.6.ii.a.8.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).glycopeptide_teicoplanin?
      col 'uti.6.ii.a.8.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).glycopeptide_vancomycin?
      col 'uti.6.ii.a.8.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).glycopeptide_telavancin?

      col 'uti.6.ii.a.9', !p.uti_questionnaire.get_appendix_antibiotics_at(1).lincosamide.nil?
      col 'uti.6.ii.a.9.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).lincosamide_clindamycin?
      col 'uti.6.ii.a.9.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).lincosamide_lincomycin?

      col 'uti.6.ii.a.10', !p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolide.nil?
      col 'uti.6.ii.a.10.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolide_azithromycin?
      col 'uti.6.ii.a.10.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolide_clarithromycin?
      col 'uti.6.ii.a.10.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolide_erythromycin?
      col 'uti.6.ii.a.10.iv', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolide_roxithromycin?
      col 'uti.6.ii.a.10.v', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolide_telithromycin?
      col 'uti.6.ii.a.10.vi', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolide_spiramycin?

      col 'uti.6.ii.a.11', !p.uti_questionnaire.get_appendix_antibiotics_at(1).monobactam.nil?
      col 'uti.6.ii.a.11.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).monobactam_aztreonam?

      col 'uti.6.ii.a.12', !p.uti_questionnaire.get_appendix_antibiotics_at(1).nitrofuran.nil?
      col 'uti.6.ii.a.12.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).nitrofuran_furazolidine?
      col 'uti.6.ii.a.12.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).nitrofuran_nitrofurantoin?

      col 'uti.6.ii.a.13', !p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin.nil?
      col 'uti.6.ii.a.13.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_amoxicillin?
      col 'uti.6.ii.a.13.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_ampicillin?
      col 'uti.6.ii.a.13.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_nafcillin?
      col 'uti.6.ii.a.13.iv', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_oxacillin?
      col 'uti.6.ii.a.13.v', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_ticarcillin?
      col 'uti.6.ii.a.13.vi', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_penicillin_g?
      col 'uti.6.ii.a.13.vii', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_methicillin?
      #col 'uti.6.ii.a.13.viii', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations
      col 'uti.6.ii.a.13.viii.a', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_amoxicillin_clavulunate?
      col 'uti.6.ii.a.13.viii.b', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_ampicillin_sulbactam?
      col 'uti.6.ii.a.13.viii.c', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_piperacillin_tazobactam?
      col 'uti.6.ii.a.13.viii.d', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillin_ticarcillin_claculunate?

      col 'uti.6.ii.a.14', !p.uti_questionnaire.get_appendix_antibiotics_at(1).polypeptide.nil?
      col 'uti.6.ii.a.14.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).polypeptide_bacitracin?
      col 'uti.6.ii.a.14.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).polypeptide_colistin?
      col 'uti.6.ii.a.14.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).polypeptide_polymyxin_b?

      col 'uti.6.ii.a.15', !p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone.nil?
      col 'uti.6.ii.a.15.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_ciprofloxacin?
      col 'uti.6.ii.a.15.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_enoxacin?
      col 'uti.6.ii.a.15.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_gatifloxacin?
      col 'uti.6.ii.a.15.iv', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_gemifloxacin?
      col 'uti.6.ii.a.15.v', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_levofloxacin?
      col 'uti.6.ii.a.15.vi', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_lomefloxacin?
      col 'uti.6.ii.a.15.vii', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_moxifloxacin?
      col 'uti.6.ii.a.15.viii', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_nalidixic_acid?
      col 'uti.6.ii.a.15.ix', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_norfloxacin?
      col 'uti.6.ii.a.15.x', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolone_ofloxacin?

      col 'uti.6.ii.a.16', !p.uti_questionnaire.get_appendix_antibiotics_at(1).sulfonamide.nil?
      col 'uti.6.ii.a.16.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).sulfonamide_sulfamethoxazole?
      col 'uti.6.ii.a.16.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).sulfonamide_trimephtoprim_sulfamethoxazole?

      col 'uti.6.ii.a.17', !p.uti_questionnaire.get_appendix_antibiotics_at(1).tetracycline.nil?
      col 'uti.6.ii.a.17.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).tetracycline_doxycycline?
      col 'uti.6.ii.a.17.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).tetracycline_tetracycline?

      col 'uti.6.ii.a.18', !p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug.nil?
      col 'uti.6.ii.a.18.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_clofazimine?
      col 'uti.6.ii.a.18.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_dapsone?
      col 'uti.6.ii.a.18.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_capreomycin?
      col 'uti.6.ii.a.18.iv', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_cycloserine?
      col 'uti.6.ii.a.18.v', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_ethembutol?
      col 'uti.6.ii.a.18.vi', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_ethionamide?
      col 'uti.6.ii.a.18.vii', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_isoniazid?
      col 'uti.6.ii.a.18.viii', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_pyranizamide?
      col 'uti.6.ii.a.18.ix', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_rifampicin?
      col 'uti.6.ii.a.18.x', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_streptomycin?

      col 'uti.6.ii.a.19', !p.uti_questionnaire.get_appendix_antibiotics_at(1).other.nil?
      col 'uti.6.ii.a.19.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).other_chloramphenicol?
      col 'uti.6.ii.a.19.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).other_fosfomycin?
      col 'uti.6.ii.a.19.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).other_metronidazole?
      col 'uti.6.ii.a.19.iv', p.uti_questionnaire.get_appendix_antibiotics_at(1).other_trimethoprim?


#       col 'uti.6.i', p.uti_questionnaire.treatment
#       col 'uti.6.ii.a', p.uti_questionnaire.get_appendix_antibiotics_at(1).aminoglycosides
#       col 'uti.6.ii.a.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).aminoglycosides_gentamicin
#       col 'uti.6.ii.a.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).aminoglycosides_amikacin
#       col 'uti.6.ii.a.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).aminoglycosides_other
#       col 'uti.6.ii.b', p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenems
#       col 'uti.6.ii.b.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenems_ertapenem
#       col 'uti.6.ii.b.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenems_imipenem
#       col 'uti.6.ii.b.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenems_doripenem
#       col 'uti.6.ii.b.4', p.uti_questionnaire.get_appendix_antibiotics_at(1).carbapenems_meropenem
#       col 'uti.6.ii.c', p.uti_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporins
#       col 'uti.6.ii.c.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporins_cefadroxil
#       col 'uti.6.ii.c.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporins_cefazolin
#       col 'uti.6.ii.c.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporins_cefalexin
#       col 'uti.6.ii.d', p.uti_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporins
#       col 'uti.6.ii.d.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporins_cefaclor
#       col 'uti.6.ii.d.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporins_cefprozil
#       col 'uti.6.ii.d.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporins_cefuroxime
#       col 'uti.6.ii.e', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins
#       col 'uti.6.ii.e.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_cefixim
#       col 'uti.6.ii.e.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_cefdinir
#       col 'uti.6.ii.e.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_cefotaxime
#       col 'uti.6.ii.e.4', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_cefpodoxime
#       col 'uti.6.ii.e.v', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_ceftazidime
#       col 'uti.6.ii.e.6', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_ceftibuten
#       col 'uti.6.ii.e.7', p.uti_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_ceftriaxone
#       col 'uti.6.ii.f', p.uti_questionnaire.get_appendix_antibiotics_at(1).fourth_generation_cephalosporins
#       col 'uti.6.ii.f.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).fourth_generation_cephalosporins_cefepime
#       col 'uti.6.ii.g', p.uti_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporins
#       col 'uti.6.ii.g.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporins_ceftaroline_fosamil
#       col 'uti.6.ii.g.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporins_ceftobiprole
#       col 'uti.6.ii.h', p.uti_questionnaire.get_appendix_antibiotics_at(1).glycopeptides
#       col 'uti.6.ii.h.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).glycopeptides_teicoplanin
#       col 'uti.6.ii.h.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).glycopeptides_vancomycin
#       col 'uti.6.ii.h.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).glycopeptides_telavancin
#       col 'uti.6.ii.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).lincosamides
#       col 'uti.6.ii.i.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).lincosamides_clindamycin
#       col 'uti.6.ii.i.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).lincosamides_lincomycin
#       col 'uti.6.ii.j', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolides
#       col 'uti.6.ii.j.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolides_azithromycin
#       col 'uti.6.ii.j.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolides_clarithromycin
#       col 'uti.6.ii.j.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolides_erythromycin
#       col 'uti.6.ii.j.4', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolides_roxithromycin
#       col 'uti.6.ii.j.5', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolides_telithromycin
#       col 'uti.6.ii.j.6', p.uti_questionnaire.get_appendix_antibiotics_at(1).macrolides_spiramycin
#       col 'uti.6.ii.k', p.uti_questionnaire.get_appendix_antibiotics_at(1).monobactams
#       col 'uti.6.ii.k.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).monobactams_aztreonam
#       col 'uti.6.ii.l', p.uti_questionnaire.get_appendix_antibiotics_at(1).nitrofurans
#       col 'uti.6.ii.l.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).nitrofurans_furazolidine
#       col 'uti.6.ii.l.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).nitrofurans_nitrofurantoin
#       col 'uti.6.ii.m', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins
#       col 'uti.6.ii.m.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_amoxicillin
#       col 'uti.6.ii.m.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_ampicillin
#       col 'uti.6.ii.m.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_nafcillin
#       col 'uti.6.ii.m.4', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_oxacillin
#       col 'uti.6.ii.m.5', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_ticarcillin
#       col 'uti.6.ii.m.6', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_g
#       col 'uti.6.ii.m.7', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_methicillin
#       col 'uti.6.ii.m.8', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations
#       col 'uti.6.ii.m.8.i', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations_amoxicillin_clavulunate
#       col 'uti.6.ii.m.8.ii', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations_ampicillin_sulbactam
#       col 'uti.6.ii.m.8.iii', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations_piperacillin_tazobactam
#       col 'uti.6.ii.m.8.iv', p.uti_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations_ticarcillin_claculunate
#       col 'uti.6.ii.n', p.uti_questionnaire.get_appendix_antibiotics_at(1).polypeptides
#       col 'uti.6.ii.n.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).polypeptides_bacitracin
#       col 'uti.6.ii.n.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).polypeptides_colistin
#       col 'uti.6.ii.n.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).polypeptides_polymyxin_b
#       col 'uti.6.ii.o', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones
#       col 'uti.6.ii.o.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_ciprofloxacin
#       col 'uti.6.ii.o.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_enoxacin
#       col 'uti.6.ii.o.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_gatifloxacin
#       col 'uti.6.ii.o.4', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_gemifloxacin
#       col 'uti.6.ii.o.5', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_levofloxacin
#       col 'uti.6.ii.o.6', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_lomefloxacin
#       col 'uti.6.ii.o.7', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_moxifloxacin
#       col 'uti.6.ii.o.8', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_nalidixic_acid
#       col 'uti.6.ii.o.9', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_norfloxacin
#       col 'uti.6.ii.o.10', p.uti_questionnaire.get_appendix_antibiotics_at(1).quinolones_ofloxacin
#       col 'uti.6.ii.p', p.uti_questionnaire.get_appendix_antibiotics_at(1).sulfonamides
#       col 'uti.6.ii.p.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).sulfonamides_sulfamethoxazole
#       col 'uti.6.ii.p.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).sulfonamides_trimephtoprim_sulfamethoxazole
#       col 'uti.6.ii.q', p.uti_questionnaire.get_appendix_antibiotics_at(1).tetracyclines
#       col 'uti.6.ii.q.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).tetracyclines_doxycycline
#       col 'uti.6.ii.q.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).tetracyclines_tetracycline
#       col 'uti.6.ii.r', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs
#       col 'uti.6.ii.r.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_clofazimine
#       col 'uti.6.ii.r.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_dapsone
#       col 'uti.6.ii.r.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_capreomycin
#       col 'uti.6.ii.r.4', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_cycloserine
#       col 'uti.6.ii.r.5', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_ethembutol
#       col 'uti.6.ii.r.6', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_ethionamide
#       col 'uti.6.ii.r.7', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_isoniazid
#       col 'uti.6.ii.r.8', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_pyranizamide
#       col 'uti.6.ii.r.9', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_rifampicin
#       col 'uti.6.ii.r.10', p.uti_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_streptomycin
#       col 'uti.6.ii.s', p.uti_questionnaire.get_appendix_antibiotics_at(1).others
#       col 'uti.6.ii.s.1', p.uti_questionnaire.get_appendix_antibiotics_at(1).others_chloramphenicol
#       col 'uti.6.ii.s.2', p.uti_questionnaire.get_appendix_antibiotics_at(1).others_fosfomycin
#       col 'uti.6.ii.s.3', p.uti_questionnaire.get_appendix_antibiotics_at(1).others_metronidazole
#       col 'uti.6.ii.s.4', p.uti_questionnaire.get_appendix_antibiotics_at(1).others_trimethoprim

      # Patient SSI
      col 'ssi.1.i.a', p.ssi_questionnaire.appendix_comorbidity&.myocardialinfarction
      col 'ssi.1.i.b', p.ssi_questionnaire.appendix_comorbidity&.congestiveheartfailure
      col 'ssi.1.i.c', p.ssi_questionnaire.appendix_comorbidity&.vasculardisease
      col 'ssi.1.i.d', p.ssi_questionnaire.appendix_comorbidity&.cerebrovascular
      col 'ssi.1.i.e', p.ssi_questionnaire.appendix_comorbidity&.dementia
      col 'ssi.1.i.f', p.ssi_questionnaire.appendix_comorbidity&.pulmonary
      col 'ssi.1.i.g', p.ssi_questionnaire.appendix_comorbidity&.tissuedisease
      col 'ssi.1.i.h', p.ssi_questionnaire.appendix_comorbidity&.ulcerdisease
      col 'ssi.1.i.i', p.ssi_questionnaire.appendix_comorbidity&.mildliver
      col 'ssi.1.i.j', p.ssi_questionnaire.appendix_comorbidity&.diabetes
      col 'ssi.1.ii.a', p.ssi_questionnaire.appendix_comorbidity&.hemiplegia
      col 'ssi.1.ii.b', p.ssi_questionnaire.appendix_comorbidity&.renaldisease
      col 'ssi.1.ii.c', p.ssi_questionnaire.appendix_comorbidity&.diabetesorgandamage
      col 'ssi.1.ii.d', p.ssi_questionnaire.appendix_comorbidity&.tumor
      col 'ssi.1.ii.e', p.ssi_questionnaire.appendix_comorbidity&.leukaemia
      col 'ssi.1.ii.f', p.ssi_questionnaire.appendix_comorbidity&.lymphoma
      col 'ssi.1.iii.a', p.ssi_questionnaire.appendix_comorbidity&.severeliverdamage
      col 'ssi.1.iv.a', p.ssi_questionnaire.appendix_comorbidity&.metastatictumor
      col 'ssi.1.iv.b', p.ssi_questionnaire.appendix_comorbidity&.aids
      col 'ssi.2.i', p.ssi_questionnaire.previous
      col 'ssi.2.ii', p.ssi_questionnaire.tractobstruction
      col 'ssi.2.ii.a.1', p.ssi_questionnaire.tractobjstructionspecify
      col 'ssi.2.iii.a', p.ssi_questionnaire.urinarystones_calyceal
      col 'ssi.2.iii.b', p.ssi_questionnaire.urinarystones_renalpelvic
      col 'ssi.2.iii.c', p.ssi_questionnaire.urinarystones_ureteral
      col 'ssi.2.iii.d', p.ssi_questionnaire.urinarystones_bladder
      col 'ssi.2.iv', p.ssi_questionnaire.treatment
      col 'ssi.2.iv.a.1', p.ssi_questionnaire.treatmentspecify
      col 'ssi.2.v', p.ssi_questionnaire.hospitalisation
      col 'ssi.2.vi.a', p.ssi_questionnaire.catheter_urethral
      col 'ssi.2.vi.b', p.ssi_questionnaire.catheter_suprapubic
      col 'ssi.2.vi.c', p.ssi_questionnaire.catheter_ureteralstent
      col 'ssi.2.vi.d', p.ssi_questionnaire.catheter_nephrostomy
      col 'ssi.2.vi.e', p.ssi_questionnaire.catheter_others
      col 'ssi.2.vii', p.ssi_questionnaire.catheterduration
      col 'ssi.3.i', p.ssi_questionnaire.intervention_endoscopic
      col 'ssi.3.ii', p.ssi_questionnaire.intervention_percutaneous
      col 'ssi.3.iii', p.ssi_questionnaire.intervention_laparoscopic
      col 'ssi.3.iv', p.ssi_questionnaire.intervention_opensurgery
      # SSI
      col 'ssi.3.v', p.ssi_questionnaire.trus_biopsy

      col 'ssi.3.vi', p.ssi_questionnaire.intervention_others
      col 'ssi.3.vii', p.ssi_questionnaire.intervention_contamination
      col 'ssi.4.i', p.ssi_questionnaire.diagnosedate
      col 'ssi.4.ii', p.ssi_questionnaire.clinicaldiagnosis
      col 'ssi.4.ii.g.1', p.ssi_questionnaire.clinicaldiagnosisspecify

      # SSI
      col 'ssi.4.iii.a', p.ssi_questionnaire.superficialssi
      col 'ssi.4.iii.b', p.ssi_questionnaire.deepssi
      col 'ssi.4.iii.c', p.ssi_questionnaire.organssi

      col 'ssi.5.i', p.ssi_questionnaire.provennauti
      col 'ssi.5.i.1', p.ssi_questionnaire.culturetissue_urine
      col 'ssi.5.i.2', p.ssi_questionnaire.culturetissue_blood
      col 'ssi.5.i.3', p.ssi_questionnaire.culturetissue_fluidswab
      col 'ssi.5.i.4', p.ssi_questionnaire.culturetissue_other
      col 'ssi.5.i.4.i', p.ssi_questionnaire.culturetissue_specify
      col 'ssi.5.ii', p.ssi_questionnaire.antibioticculture


      col 'ssi.5.ii.a.1', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).aminoglycoside.nil?
      col 'ssi.5.ii.a.1.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).aminoglycoside_gentamicin?
      col 'ssi.5.ii.a.1.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).aminoglycoside_amikacin?
      col 'ssi.5.ii.a.1.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).aminoglycoside_other?

      col 'ssi.5.ii.a.2', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).carbapenem.nil?
      col 'ssi.5.ii.a.2.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).carbapenem_ertapenem?
      col 'ssi.5.ii.a.2.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).carbapenem_imipenem?
      col 'ssi.5.ii.a.2.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).carbapenem_doripenem?
      col 'ssi.5.ii.a.2.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(0).carbapenem_meropenem?

      col 'ssi.5.ii.a.3', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).first_generation_cephalosporin.nil?
      col 'ssi.5.ii.a.3.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).first_generation_cephalosporin_cefadroxil?
      col 'ssi.5.ii.a.3.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).first_generation_cephalosporin_cefazolin?
      col 'ssi.5.ii.a.3.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).first_generation_cephalosporin_cefalexin?

      col 'ssi.5.ii.a.4', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).second_generation_cephalosporin.nil?
      col 'ssi.5.ii.a.4.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).second_generation_cephalosporin_cefaclor?
      col 'ssi.5.ii.a.4.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).second_generation_cephalosporin_cefprozil?
      col 'ssi.5.ii.a.4.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).second_generation_cephalosporin_cefuroxime?

      col 'ssi.5.ii.a.5', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin.nil?
      col 'ssi.5.ii.a.5.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_cefixim?
      col 'ssi.5.ii.a.5.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_cefdinir?
      col 'ssi.5.ii.a.5.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_cefotaxime?
      col 'ssi.5.ii.a.5.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_cefpodoxime?
      col 'ssi.5.ii.a.5.v', p.ssi_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_ceftazidime?
      col 'ssi.5.ii.a.5.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_ceftibuten?
      col 'ssi.5.ii.a.5.vii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).third_generation_cephalosporin_ceftriaxone?

      col 'ssi.5.ii.a.6', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).fourth_generation_cephalosporin.nil?
      col 'ssi.5.ii.a.6.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).fourth_generation_cephalosporin_cefepime?

      col 'ssi.5.ii.a.7', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).fifth_generation_cephalosporin.nil?
      col 'ssi.5.ii.a.7.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).fifth_generation_cephalosporin_ceftaroline_fosamil?
      col 'ssi.5.ii.a.7.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).fifth_generation_cephalosporin_ceftobiprole?

      col 'ssi.5.ii.a.8', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).glycopeptide.nil?
      col 'ssi.5.ii.a.8.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).glycopeptide_teicoplanin?
      col 'ssi.5.ii.a.8.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).glycopeptide_vancomycin?
      col 'ssi.5.ii.a.8.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).glycopeptide_telavancin?

      col 'ssi.5.ii.a.9', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).lincosamide.nil?
      col 'ssi.5.ii.a.9.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).lincosamide_clindamycin?
      col 'ssi.5.ii.a.9.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).lincosamide_lincomycin?

      col 'ssi.5.ii.a.10', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).macrolide.nil?
      col 'ssi.5.ii.a.10.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).macrolide_azithromycin?
      col 'ssi.5.ii.a.10.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).macrolide_clarithromycin?
      col 'ssi.5.ii.a.10.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).macrolide_erythromycin?
      col 'ssi.5.ii.a.10.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(0).macrolide_roxithromycin?
      col 'ssi.5.ii.a.10.v', p.ssi_questionnaire.get_appendix_antibiotics_at(0).macrolide_telithromycin?
      col 'ssi.5.ii.a.10.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(0).macrolide_spiramycin?

      col 'ssi.5.ii.a.11', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).monobactam.nil?
      col 'ssi.5.ii.a.11.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).monobactam_aztreonam?

      col 'ssi.5.ii.a.12', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).nitrofuran.nil?
      col 'ssi.5.ii.a.12.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).nitrofuran_furazolidine?
      col 'ssi.5.ii.a.12.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).nitrofuran_nitrofurantoin?

      col 'ssi.5.ii.a.13', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin.nil?
      col 'ssi.5.ii.a.13.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_amoxicillin?
      col 'ssi.5.ii.a.13.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_ampicillin?
      col 'ssi.5.ii.a.13.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_nafcillin?
      col 'ssi.5.ii.a.13.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_oxacillin?
      col 'ssi.5.ii.a.13.v', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_ticarcillin?
      col 'ssi.5.ii.a.13.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_penicillin_g?
      col 'ssi.5.ii.a.13.vii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_methicillin?
      #col 'ssi.5.ii.a.13.viii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillins_penicillin_combinations
      col 'ssi.5.ii.a.13.viii.a', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_amoxicillin_clavulunate?
      col 'ssi.5.ii.a.13.viii.b', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_ampicillin_sulbactam?
      col 'ssi.5.ii.a.13.viii.c', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_piperacillin_tazobactam?
      col 'ssi.5.ii.a.13.viii.d', p.ssi_questionnaire.get_appendix_antibiotics_at(0).penicillin_ticarcillin_claculunate?

      col 'ssi.5.ii.a.14', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).polypeptide.nil?
      col 'ssi.5.ii.a.14.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).polypeptide_bacitracin?
      col 'ssi.5.ii.a.14.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).polypeptide_colistin?
      col 'ssi.5.ii.a.14.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).polypeptide_polymyxin_b?

      col 'ssi.5.ii.a.15', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone.nil?
      col 'ssi.5.ii.a.15.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_ciprofloxacin?
      col 'ssi.5.ii.a.15.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_enoxacin?
      col 'ssi.5.ii.a.15.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_gatifloxacin?
      col 'ssi.5.ii.a.15.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_gemifloxacin?
      col 'ssi.5.ii.a.15.v', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_levofloxacin?
      col 'ssi.5.ii.a.15.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_lomefloxacin?
      col 'ssi.5.ii.a.15.vii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_moxifloxacin?
      col 'ssi.5.ii.a.15.viii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_nalidixic_acid?
      col 'ssi.5.ii.a.15.ix', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_norfloxacin?
      col 'ssi.5.ii.a.15.x', p.ssi_questionnaire.get_appendix_antibiotics_at(0).quinolone_ofloxacin?

      col 'ssi.5.ii.a.16', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).sulfonamide.nil?
      col 'ssi.5.ii.a.16.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).sulfonamide_sulfamethoxazole?
      col 'ssi.5.ii.a.16.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).sulfonamide_trimephtoprim_sulfamethoxazole?

      col 'ssi.5.ii.a.17', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).tetracycline.nil?
      col 'ssi.5.ii.a.17.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).tetracycline_doxycycline?
      col 'ssi.5.ii.a.17.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).tetracycline_tetracycline?

      col 'ssi.5.ii.a.18', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug.nil?
      col 'ssi.5.ii.a.18.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_clofazimine?
      col 'ssi.5.ii.a.18.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_dapsone?
      col 'ssi.5.ii.a.18.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_capreomycin?
      col 'ssi.5.ii.a.18.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_cycloserine?
      col 'ssi.5.ii.a.18.v', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_ethembutol?
      col 'ssi.5.ii.a.18.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_ethionamide?
      col 'ssi.5.ii.a.18.vii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_isoniazid?
      col 'ssi.5.ii.a.18.viii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_pyranizamide?
      col 'ssi.5.ii.a.18.ix', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_rifampicin?
      col 'ssi.5.ii.a.18.x', p.ssi_questionnaire.get_appendix_antibiotics_at(0).antimycobacterial_drug_streptomycin?

      col 'ssi.5.ii.a.19', !p.ssi_questionnaire.get_appendix_antibiotics_at(0).other.nil?
      col 'ssi.5.ii.a.19.i', p.ssi_questionnaire.get_appendix_antibiotics_at(0).other_chloramphenicol?
      col 'ssi.5.ii.a.19.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).other_fosfomycin?
      col 'ssi.5.ii.a.19.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(0).other_metronidazole?
      col 'ssi.5.ii.a.19.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(0).other_trimethoprim?

      col 'ssi.5.iii.a.1', p.ssi_questionnaire.appendix_culture_result&.first_pathogen
      col 'ssi.5.iii.a.1_specify', p.ssi_questionnaire.appendix_culture_result&.first_pathogen_specify
      col 'ssi.5.iii.a.2', p.ssi_questionnaire.appendix_culture_result&.first_pathogen_enter_cfu_ml
      col 'ssi.5.iii.a.3.i', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins
      col 'ssi.5.iii.a.3.i.a', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin
      col 'ssi.5.iii.a.3.i.a_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_s
      col 'ssi.5.iii.a.3.i.b', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_bli
      col 'ssi.5.iii.a.3.i.b_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_bli_s
      col 'ssi.5.iii.a.3.i.c', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin
      col 'ssi.5.iii.a.3.i.c_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_s
      col 'ssi.5.iii.a.3.i.d', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_bli
      col 'ssi.5.iii.a.3.i.d_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_bli_s
      col 'ssi.5.iii.a.3.i.e', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_oxacillin
      col 'ssi.5.iii.a.3.i.e_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_oxacillin_s
      col 'ssi.5.iii.a.3.i.f', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ticarcillin
      col 'ssi.5.iii.a.3.i.f_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ticarcillin_s
      col 'ssi.5.iii.a.3.ii', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins
      col 'ssi.5.iii.a.3.ii.a', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cephazolin
      col 'ssi.5.iii.a.3.ii.a_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cephazolin_s
      col 'ssi.5.iii.a.3.ii.b', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefuroxime
      col 'ssi.5.iii.a.3.ii.b_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefuroxime_s
      col 'ssi.5.iii.a.3.ii.c', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotaxime
      col 'ssi.5.iii.a.3.ii.c_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotaxime_s
      col 'ssi.5.iii.a.3.ii.d', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftazidime
      col 'ssi.5.iii.a.3.ii.d_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftazidime_s
      col 'ssi.5.iii.a.3.ii.e', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefepime
      col 'ssi.5.iii.a.3.ii.e_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefepime_s
      col 'ssi.5.iii.a.3.ii.f', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftaroline
      col 'ssi.5.iii.a.3.ii.f_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftaroline_s
      col 'ssi.5.iii.a.3.ii.g.1', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefoxitin
      col 'ssi.5.iii.a.3.ii.g.1_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefoxitin_s
      col 'ssi.5.iii.a.3.ii.g.2', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotetan
      col 'ssi.5.iii.a.3.ii.g.2_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotetan_s
      col 'ssi.5.iii.a.3.iii', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem
      col 'ssi.5.iii.a.3.iii.a', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_imipenem
      col 'ssi.5.iii.a.3.iii.a_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_imipenem_s
      col 'ssi.5.iii.a.3.iii.b', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_doripenem
      col 'ssi.5.iii.a.3.iii.b_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_doripenem_s
      col 'ssi.5.iii.a.3.iii.c', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_ertapenem
      col 'ssi.5.iii.a.3.iii.c_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_ertapenem_s
      col 'ssi.5.iii.a.3.iv', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides
      col 'ssi.5.iii.a.3.iv.a', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_gentamicin
      col 'ssi.5.iii.a.3.iv.a_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_gentamicin_s
      col 'ssi.5.iii.a.3.iv.b', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_amikacin
      col 'ssi.5.iii.a.3.iv.b_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_amikacin_s
      col 'ssi.5.iii.a.3.iv.c', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_tobramicin
      col 'ssi.5.iii.a.3.iv.c_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_tobramicin_s
      col 'ssi.5.iii.a.3.iv.d', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_netilmicin
      col 'ssi.5.iii.a.3.iv.d_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_netilmicin_s
      col 'ssi.5.iii.a.3.v', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones
      col 'ssi.5.iii.a.3.v.a', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ofloxacin
      col 'ssi.5.iii.a.3.v.a_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ofloxacin_s
      col 'ssi.5.iii.a.3.v.b', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ciprofloxacin
      col 'ssi.5.iii.a.3.v.b_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ciprofloxacin_s
      col 'ssi.5.iii.a.3.v.c', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_levofloxacin
      col 'ssi.5.iii.a.3.v.c_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_levofloxacin_s
      col 'ssi.5.iii.a.3.v.d', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_moxifloxacin
      col 'ssi.5.iii.a.3.v.d_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_moxifloxacin_s
      col 'ssi.5.iii.a.3.vi', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines
      col 'ssi.5.iii.a.3.vi.a', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_doxycyclin
      col 'ssi.5.iii.a.3.vi.a_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_doxycyclin_s
      col 'ssi.5.iii.a.3.vi.b', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_tetracycline
      col 'ssi.5.iii.a.3.vi.b_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_tetracycline_s
      col 'ssi.5.iii.a.3.vi.c', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_minocycline
      col 'ssi.5.iii.a.3.vi.c_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_minocycline_s
      col 'ssi.5.iii.a.3.vi.d', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_glycylcylines
      col 'ssi.5.iii.a.3.vi.d_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_glycylcylines_s
      col 'ssi.5.iii.a.3.vii', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fosfomycin
      col 'ssi.5.iii.a.3.vii_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fosfomycin_s
      col 'ssi.5.iii.a.3.viii', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_trimethoprim
      col 'ssi.5.iii.a.3.viii_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_trimethoprim_s
      col 'ssi.5.iii.a.3.ix', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_nitrofurantoin
      col 'ssi.5.iii.a.3.ix_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_nitrofurantoin_s
      col 'ssi.5.iii.a.3.x', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_erythromycin
      col 'ssi.5.iii.a.3.x_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_erythromycin_s
      col 'ssi.5.iii.a.3.xi', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_clindamycin
      col 'ssi.5.iii.a.3.xi_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_clindamycin_s
      col 'ssi.5.iii.a.3.xii', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides
      col 'ssi.5.iii.a.3.xii.a', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_vancomycin
      col 'ssi.5.iii.a.3.xii.a_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_vancomycin_s
      col 'ssi.5.iii.a.3.xii.b', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_teicoplanin
      col 'ssi.5.iii.a.3.xii.b_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_teicoplanin_s
      col 'ssi.5.iii.a.3.xii.c', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_telavancin
      col 'ssi.5.iii.a.3.xii.c_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_telavancin_s
      col 'ssi.5.iii.a.3.xiii', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_linezolid
      col 'ssi.5.iii.a.3.xiii_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_linezolid_s
      col 'ssi.5.iii.a.3.xiv', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_phenicols
      col 'ssi.5.iii.a.3.xiv_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_phenicols_s
      col 'ssi.5.iii.a.3.xv', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins
      col 'ssi.5.iii.a.3.xv.a', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_colistins
      col 'ssi.5.iii.a.3.xv.a_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_colistins_s
      col 'ssi.5.iii.a.3.xv.b', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_polymixin
      col 'ssi.5.iii.a.3.xv.b_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_polymixin_s
      col 'ssi.5.iii.a.3.xvi', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_monobactams
      col 'ssi.5.iii.a.3.xvi_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_monobactams_s
      col 'ssi.5.iii.a.3.xvii', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_daptomycin
      col 'ssi.5.iii.a.3.xvii_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_daptomycin_s
      col 'ssi.5.iii.a.3.xviii', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_rifampin
      col 'ssi.5.iii.a.3.xviii_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_rifampin_s
      col 'ssi.5.iii.a.3.xix', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fucidanes
      col 'ssi.5.iii.a.3.xix_s', p.ssi_questionnaire.appendix_culture_result&.first_susceptibility_test_fucidanes_s
      col 'ssi.5.iii.b.1', p.ssi_questionnaire.appendix_culture_result&.second_pathogen
      col 'ssi.5.iii.b.1_specify', p.ssi_questionnaire.appendix_culture_result&.second_pathogen_specify
      col 'ssi.5.iii.b.2', p.ssi_questionnaire.appendix_culture_result&.second_pathogen_enter_cfu_ml
      col 'ssi.5.iii.b.3.i', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins
      col 'ssi.5.iii.b.3.i.a', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin
      col 'ssi.5.iii.b.3.i.a_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_s
      col 'ssi.5.iii.b.3.i.b', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_bli
      col 'ssi.5.iii.b.3.i.b_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_bli_s
      col 'ssi.5.iii.b.3.i.c', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin
      col 'ssi.5.iii.b.3.i.c_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_s
      col 'ssi.5.iii.b.3.i.d', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_bli
      col 'ssi.5.iii.b.3.i.d_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_bli_s
      col 'ssi.5.iii.b.3.i.e', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_oxacillin
      col 'ssi.5.iii.b.3.i.e_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_oxacillin_s
      col 'ssi.5.iii.b.3.i.f', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ticarcillin
      col 'ssi.5.iii.b.3.i.f_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ticarcillin_s
      col 'ssi.5.iii.b.3.ii', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins
      col 'ssi.5.iii.b.3.ii.a', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cephazolin
      col 'ssi.5.iii.b.3.ii.a_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cephazolin_s
      col 'ssi.5.iii.b.3.ii.b', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefuroxime
      col 'ssi.5.iii.b.3.ii.b_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefuroxime_s
      col 'ssi.5.iii.b.3.ii.c', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotaxime
      col 'ssi.5.iii.b.3.ii.c_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotaxime_s
      col 'ssi.5.iii.b.3.ii.d', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftazidime
      col 'ssi.5.iii.b.3.ii.d_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftazidime_s
      col 'ssi.5.iii.b.3.ii.e', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefepime
      col 'ssi.5.iii.b.3.ii.e_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefepime_s
      col 'ssi.5.iii.b.3.ii.f', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftaroline
      col 'ssi.5.iii.b.3.ii.f_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftaroline_s
      col 'ssi.5.iii.b.3.ii.g.1', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefoxitin
      col 'ssi.5.iii.b.3.ii.g.1_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefoxitin_s
      col 'ssi.5.iii.b.3.ii.g.2', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotetan
      col 'ssi.5.iii.b.3.ii.g.2_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotetan_s
      col 'ssi.5.iii.b.3.iii', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem
      col 'ssi.5.iii.b.3.iii.a', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_imipenem
      col 'ssi.5.iii.b.3.iii.a_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_imipenem_s
      col 'ssi.5.iii.b.3.iii.b', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_doripenem
      col 'ssi.5.iii.b.3.iii.b_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_doripenem_s
      col 'ssi.5.iii.b.3.iii.c', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_ertapenem
      col 'ssi.5.iii.b.3.iii.c_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_ertapenem_s
      col 'ssi.5.iii.b.3.iv', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides
      col 'ssi.5.iii.b.3.iv.a', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_gentamicin
      col 'ssi.5.iii.b.3.iv.a_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_gentamicin_s
      col 'ssi.5.iii.b.3.iv.b', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_amikacin
      col 'ssi.5.iii.b.3.iv.b_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_amikacin_s
      col 'ssi.5.iii.b.3.iv.c', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_tobramicin
      col 'ssi.5.iii.b.3.iv.c_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_tobramicin_s
      col 'ssi.5.iii.b.3.iv.d', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_netilmicin
      col 'ssi.5.iii.b.3.iv.d_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_netilmicin_s
      col 'ssi.5.iii.b.3.v', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones
      col 'ssi.5.iii.b.3.v.a', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ofloxacin
      col 'ssi.5.iii.b.3.v.a_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ofloxacin_s
      col 'ssi.5.iii.b.3.v.b', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ciprofloxacin
      col 'ssi.5.iii.b.3.v.b_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ciprofloxacin_s
      col 'ssi.5.iii.b.3.v.c', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_levofloxacin
      col 'ssi.5.iii.b.3.v.c_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_levofloxacin_s
      col 'ssi.5.iii.b.3.v.d', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_moxifloxacin
      col 'ssi.5.iii.b.3.v.d_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_moxifloxacin_s
      col 'ssi.5.iii.b.3.vi', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines
      col 'ssi.5.iii.b.3.vi.a', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_doxycyclin
      col 'ssi.5.iii.b.3.vi.a_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_doxycyclin_s
      col 'ssi.5.iii.b.3.vi.b', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_tetracycline
      col 'ssi.5.iii.b.3.vi.b_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_tetracycline_s
      col 'ssi.5.iii.b.3.vi.c', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_minocycline
      col 'ssi.5.iii.b.3.vi.c_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_minocycline_s
      col 'ssi.5.iii.b.3.vi.d', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_glycylcylines
      col 'ssi.5.iii.b.3.vi.d_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_glycylcylines_s
      col 'ssi.5.iii.b.3.vii', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fosfomycin
      col 'ssi.5.iii.b.3.vii_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fosfomycin_s
      col 'ssi.5.iii.b.3.viii', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_trimethoprim
      col 'ssi.5.iii.b.3.viii_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_trimethoprim_s
      col 'ssi.5.iii.b.3.ix', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_nitrofurantoin
      col 'ssi.5.iii.b.3.ix_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_nitrofurantoin_s
      col 'ssi.5.iii.b.3.x', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_erythromycin
      col 'ssi.5.iii.b.3.x_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_erythromycin_s
      col 'ssi.5.iii.b.3.xi', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_clindamycin
      col 'ssi.5.iii.b.3.xi_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_clindamycin_s
      col 'ssi.5.iii.b.3.xii', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides
      col 'ssi.5.iii.b.3.xii.a', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_vancomycin
      col 'ssi.5.iii.b.3.xii.a_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_vancomycin_s
      col 'ssi.5.iii.b.3.xii.b', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_teicoplanin
      col 'ssi.5.iii.b.3.xii.b_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_teicoplanin_s
      col 'ssi.5.iii.b.3.xii.c', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_telavancin
      col 'ssi.5.iii.b.3.xii.c_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_telavancin_s
      col 'ssi.5.iii.b.3.xiii', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_linezolid
      col 'ssi.5.iii.b.3.xiii_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_linezolid_s
      col 'ssi.5.iii.b.3.xiv', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_phenicols
      col 'ssi.5.iii.b.3.xiv_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_phenicols_s
      col 'ssi.5.iii.b.3.xv', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins
      col 'ssi.5.iii.b.3.xv.a', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_colistins
      col 'ssi.5.iii.b.3.xv.a_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_colistins_s
      col 'ssi.5.iii.b.3.xv.b', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_polymixin
      col 'ssi.5.iii.b.3.xv.b_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_polymixin_s
      col 'ssi.5.iii.b.3.xvi', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_monobactams
      col 'ssi.5.iii.b.3.xvi_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_monobactams_s
      col 'ssi.5.iii.b.3.xvii', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_daptomycin
      col 'ssi.5.iii.b.3.xvii_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_daptomycin_s
      col 'ssi.5.iii.b.3.xviii', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_rifampin
      col 'ssi.5.iii.b.3.xviii_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_rifampin_s
      col 'ssi.5.iii.b.3.xix', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fucidanes
      col 'ssi.5.iii.b.3.xix_s', p.ssi_questionnaire.appendix_culture_result&.second_susceptibility_test_fucidanes_s

      col 'ssi.6.i', p.ssi_questionnaire.treatment
      col 'ssi.6.ii.a.1', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).aminoglycoside.nil?
      col 'ssi.6.ii.a.1.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).aminoglycoside_gentamicin?
      col 'ssi.6.ii.a.1.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).aminoglycoside_amikacin?
      col 'ssi.6.ii.a.1.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).aminoglycoside_other?

      col 'ssi.6.ii.a.2', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenem.nil?
      col 'ssi.6.ii.a.2.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenem_ertapenem?
      col 'ssi.6.ii.a.2.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenem_imipenem?
      col 'ssi.6.ii.a.2.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenem_doripenem?
      col 'ssi.6.ii.a.2.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenem_meropenem?

      col 'ssi.6.ii.a.3', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporin.nil?
      col 'ssi.6.ii.a.3.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporin_cefadroxil?
      col 'ssi.6.ii.a.3.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporin_cefazolin?
      col 'ssi.6.ii.a.3.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporin_cefalexin?

      col 'ssi.6.ii.a.4', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporin.nil?
      col 'ssi.6.ii.a.4.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporin_cefaclor?
      col 'ssi.6.ii.a.4.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporin_cefprozil?
      col 'ssi.6.ii.a.4.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporin_cefuroxime?

      col 'ssi.6.ii.a.5', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin.nil?
      col 'ssi.6.ii.a.5.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_cefixim?
      col 'ssi.6.ii.a.5.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_cefdinir?
      col 'ssi.6.ii.a.5.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_cefotaxime?
      col 'ssi.6.ii.a.5.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_cefpodoxime?
      col 'ssi.6.ii.a.5.v', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_ceftazidime?
      col 'ssi.6.ii.a.5.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_ceftibuten?
      col 'ssi.6.ii.a.5.vii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporin_ceftriaxone?

      col 'ssi.6.ii.a.6', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).fourth_generation_cephalosporin.nil?
      col 'ssi.6.ii.a.6.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).fourth_generation_cephalosporin_cefepime?

      col 'ssi.6.ii.a.7', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporin.nil?
      col 'ssi.6.ii.a.7.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporin_ceftaroline_fosamil?
      col 'ssi.6.ii.a.7.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporin_ceftobiprole?

      col 'ssi.6.ii.a.8', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).glycopeptide.nil?
      col 'ssi.6.ii.a.8.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).glycopeptide_teicoplanin?
      col 'ssi.6.ii.a.8.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).glycopeptide_vancomycin?
      col 'ssi.6.ii.a.8.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).glycopeptide_telavancin?

      col 'ssi.6.ii.a.9', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).lincosamide.nil?
      col 'ssi.6.ii.a.9.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).lincosamide_clindamycin?
      col 'ssi.6.ii.a.9.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).lincosamide_lincomycin?

      col 'ssi.6.ii.a.10', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolide.nil?
      col 'ssi.6.ii.a.10.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolide_azithromycin?
      col 'ssi.6.ii.a.10.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolide_clarithromycin?
      col 'ssi.6.ii.a.10.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolide_erythromycin?
      col 'ssi.6.ii.a.10.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolide_roxithromycin?
      col 'ssi.6.ii.a.10.v', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolide_telithromycin?
      col 'ssi.6.ii.a.10.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolide_spiramycin?

      col 'ssi.6.ii.a.11', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).monobactam.nil?
      col 'ssi.6.ii.a.11.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).monobactam_aztreonam?

      col 'ssi.6.ii.a.12', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).nitrofuran.nil?
      col 'ssi.6.ii.a.12.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).nitrofuran_furazolidine?
      col 'ssi.6.ii.a.12.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).nitrofuran_nitrofurantoin?

      col 'ssi.6.ii.a.13', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin.nil?
      col 'ssi.6.ii.a.13.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_amoxicillin?
      col 'ssi.6.ii.a.13.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_ampicillin?
      col 'ssi.6.ii.a.13.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_nafcillin?
      col 'ssi.6.ii.a.13.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_oxacillin?
      col 'ssi.6.ii.a.13.v', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_ticarcillin?
      col 'ssi.6.ii.a.13.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_penicillin_g?
      col 'ssi.6.ii.a.13.vii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_methicillin?
      #col 'ssi.6.ii.a.13.viii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations
      col 'ssi.6.ii.a.13.viii.a', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_amoxicillin_clavulunate?
      col 'ssi.6.ii.a.13.viii.b', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_ampicillin_sulbactam?
      col 'ssi.6.ii.a.13.viii.c', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_piperacillin_tazobactam?
      col 'ssi.6.ii.a.13.viii.d', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillin_ticarcillin_claculunate?

      col 'ssi.6.ii.a.14', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).polypeptide.nil?
      col 'ssi.6.ii.a.14.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).polypeptide_bacitracin?
      col 'ssi.6.ii.a.14.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).polypeptide_colistin?
      col 'ssi.6.ii.a.14.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).polypeptide_polymyxin_b?

      col 'ssi.6.ii.a.15', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone.nil?
      col 'ssi.6.ii.a.15.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_ciprofloxacin?
      col 'ssi.6.ii.a.15.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_enoxacin?
      col 'ssi.6.ii.a.15.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_gatifloxacin?
      col 'ssi.6.ii.a.15.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_gemifloxacin?
      col 'ssi.6.ii.a.15.v', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_levofloxacin?
      col 'ssi.6.ii.a.15.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_lomefloxacin?
      col 'ssi.6.ii.a.15.vii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_moxifloxacin?
      col 'ssi.6.ii.a.15.viii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_nalidixic_acid?
      col 'ssi.6.ii.a.15.ix', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_norfloxacin?
      col 'ssi.6.ii.a.15.x', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolone_ofloxacin?

      col 'ssi.6.ii.a.16', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).sulfonamide.nil?
      col 'ssi.6.ii.a.16.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).sulfonamide_sulfamethoxazole?
      col 'ssi.6.ii.a.16.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).sulfonamide_trimephtoprim_sulfamethoxazole?

      col 'ssi.6.ii.a.17', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).tetracycline.nil?
      col 'ssi.6.ii.a.17.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).tetracycline_doxycycline?
      col 'ssi.6.ii.a.17.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).tetracycline_tetracycline?

      col 'ssi.6.ii.a.18', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug.nil?
      col 'ssi.6.ii.a.18.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_clofazimine?
      col 'ssi.6.ii.a.18.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_dapsone?
      col 'ssi.6.ii.a.18.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_capreomycin?
      col 'ssi.6.ii.a.18.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_cycloserine?
      col 'ssi.6.ii.a.18.v', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_ethembutol?
      col 'ssi.6.ii.a.18.vi', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_ethionamide?
      col 'ssi.6.ii.a.18.vii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_isoniazid?
      col 'ssi.6.ii.a.18.viii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_pyranizamide?
      col 'ssi.6.ii.a.18.ix', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_rifampicin?
      col 'ssi.6.ii.a.18.x', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drug_streptomycin?

      col 'ssi.6.ii.a.19', !p.ssi_questionnaire.get_appendix_antibiotics_at(1).other.nil?
      col 'ssi.6.ii.a.19.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).other_chloramphenicol?
      col 'ssi.6.ii.a.19.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).other_fosfomycin?
      col 'ssi.6.ii.a.19.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).other_metronidazole?
      col 'ssi.6.ii.a.19.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(1).other_trimethoprim?


#       col 'ssi.6.i', p.ssi_questionnaire.treatment
#       col 'ssi.6.ii.a', p.ssi_questionnaire.get_appendix_antibiotics_at(1).aminoglycosides
#       col 'ssi.6.ii.a.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).aminoglycosides_gentamicin
#       col 'ssi.6.ii.a.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).aminoglycosides_amikacin
#       col 'ssi.6.ii.a.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).aminoglycosides_other
#       col 'ssi.6.ii.b', p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenems
#       col 'ssi.6.ii.b.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenems_ertapenem
#       col 'ssi.6.ii.b.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenems_imipenem
#       col 'ssi.6.ii.b.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenems_doripenem
#       col 'ssi.6.ii.b.4', p.ssi_questionnaire.get_appendix_antibiotics_at(1).carbapenems_meropenem
#       col 'ssi.6.ii.c', p.ssi_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporins
#       col 'ssi.6.ii.c.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporins_cefadroxil
#       col 'ssi.6.ii.c.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporins_cefazolin
#       col 'ssi.6.ii.c.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).first_generation_cephalosporins_cefalexin
#       col 'ssi.6.ii.d', p.ssi_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporins
#       col 'ssi.6.ii.d.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporins_cefaclor
#       col 'ssi.6.ii.d.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporins_cefprozil
#       col 'ssi.6.ii.d.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).second_generation_cephalosporins_cefuroxime
#       col 'ssi.6.ii.e', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins
#       col 'ssi.6.ii.e.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_cefixim
#       col 'ssi.6.ii.e.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_cefdinir
#       col 'ssi.6.ii.e.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_cefotaxime
#       col 'ssi.6.ii.e.4', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_cefpodoxime
#       col 'ssi.6.ii.e.v', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_ceftazidime
#       col 'ssi.6.ii.e.6', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_ceftibuten
#       col 'ssi.6.ii.e.7', p.ssi_questionnaire.get_appendix_antibiotics_at(1).third_generation_cephalosporins_ceftriaxone
#       col 'ssi.6.ii.f', p.ssi_questionnaire.get_appendix_antibiotics_at(1).fourth_generation_cephalosporins
#       col 'ssi.6.ii.f.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).fourth_generation_cephalosporins_cefepime
#       col 'ssi.6.ii.g', p.ssi_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporins
#       col 'ssi.6.ii.g.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporins_ceftaroline_fosamil
#       col 'ssi.6.ii.g.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).fifth_generation_cephalosporins_ceftobiprole
#       col 'ssi.6.ii.h', p.ssi_questionnaire.get_appendix_antibiotics_at(1).glycopeptides
#       col 'ssi.6.ii.h.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).glycopeptides_teicoplanin
#       col 'ssi.6.ii.h.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).glycopeptides_vancomycin
#       col 'ssi.6.ii.h.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).glycopeptides_telavancin
#       col 'ssi.6.ii.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).lincosamides
#       col 'ssi.6.ii.i.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).lincosamides_clindamycin
#       col 'ssi.6.ii.i.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).lincosamides_lincomycin
#       col 'ssi.6.ii.j', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolides
#       col 'ssi.6.ii.j.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolides_azithromycin
#       col 'ssi.6.ii.j.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolides_clarithromycin
#       col 'ssi.6.ii.j.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolides_erythromycin
#       col 'ssi.6.ii.j.4', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolides_roxithromycin
#       col 'ssi.6.ii.j.5', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolides_telithromycin
#       col 'ssi.6.ii.j.6', p.ssi_questionnaire.get_appendix_antibiotics_at(1).macrolides_spiramycin
#       col 'ssi.6.ii.k', p.ssi_questionnaire.get_appendix_antibiotics_at(1).monobactams
#       col 'ssi.6.ii.k.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).monobactams_aztreonam
#       col 'ssi.6.ii.l', p.ssi_questionnaire.get_appendix_antibiotics_at(1).nitrofurans
#       col 'ssi.6.ii.l.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).nitrofurans_furazolidine
#       col 'ssi.6.ii.l.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).nitrofurans_nitrofurantoin
#       col 'ssi.6.ii.m', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins
#       col 'ssi.6.ii.m.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_amoxicillin
#       col 'ssi.6.ii.m.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_ampicillin
#       col 'ssi.6.ii.m.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_nafcillin
#       col 'ssi.6.ii.m.4', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_oxacillin
#       col 'ssi.6.ii.m.5', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_ticarcillin
#       col 'ssi.6.ii.m.6', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_g
#       col 'ssi.6.ii.m.7', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_methicillin
#       col 'ssi.6.ii.m.8', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations
#       col 'ssi.6.ii.m.8.i', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations_amoxicillin_clavulunate
#       col 'ssi.6.ii.m.8.ii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations_ampicillin_sulbactam
#       col 'ssi.6.ii.m.8.iii', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations_piperacillin_tazobactam
#       col 'ssi.6.ii.m.8.iv', p.ssi_questionnaire.get_appendix_antibiotics_at(1).penicillins_penicillin_combinations_ticarcillin_claculunate
#       col 'ssi.6.ii.n', p.ssi_questionnaire.get_appendix_antibiotics_at(1).polypeptides
#       col 'ssi.6.ii.n.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).polypeptides_bacitracin
#       col 'ssi.6.ii.n.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).polypeptides_colistin
#       col 'ssi.6.ii.n.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).polypeptides_polymyxin_b
#       col 'ssi.6.ii.o', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones
#       col 'ssi.6.ii.o.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_ciprofloxacin
#       col 'ssi.6.ii.o.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_enoxacin
#       col 'ssi.6.ii.o.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_gatifloxacin
#       col 'ssi.6.ii.o.4', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_gemifloxacin
#       col 'ssi.6.ii.o.5', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_levofloxacin
#       col 'ssi.6.ii.o.6', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_lomefloxacin
#       col 'ssi.6.ii.o.7', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_moxifloxacin
#       col 'ssi.6.ii.o.8', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_nalidixic_acid
#       col 'ssi.6.ii.o.9', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_norfloxacin
#       col 'ssi.6.ii.o.10', p.ssi_questionnaire.get_appendix_antibiotics_at(1).quinolones_ofloxacin
#       col 'ssi.6.ii.p', p.ssi_questionnaire.get_appendix_antibiotics_at(1).sulfonamides
#       col 'ssi.6.ii.p.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).sulfonamides_sulfamethoxazole
#       col 'ssi.6.ii.p.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).sulfonamides_trimephtoprim_sulfamethoxazole
#       col 'ssi.6.ii.q', p.ssi_questionnaire.get_appendix_antibiotics_at(1).tetracyclines
#       col 'ssi.6.ii.q.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).tetracyclines_doxycycline
#       col 'ssi.6.ii.q.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).tetracyclines_tetracycline
#       col 'ssi.6.ii.r', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs
#       col 'ssi.6.ii.r.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_clofazimine
#       col 'ssi.6.ii.r.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_dapsone
#       col 'ssi.6.ii.r.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_capreomycin
#       col 'ssi.6.ii.r.4', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_cycloserine
#       col 'ssi.6.ii.r.5', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_ethembutol
#       col 'ssi.6.ii.r.6', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_ethionamide
#       col 'ssi.6.ii.r.7', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_isoniazid
#       col 'ssi.6.ii.r.8', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_pyranizamide
#       col 'ssi.6.ii.r.9', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_rifampicin
#       col 'ssi.6.ii.r.10', p.ssi_questionnaire.get_appendix_antibiotics_at(1).antimycobacterial_drugs_streptomycin
#       col 'ssi.6.ii.s', p.ssi_questionnaire.get_appendix_antibiotics_at(1).others
#       col 'ssi.6.ii.s.1', p.ssi_questionnaire.get_appendix_antibiotics_at(1).others_chloramphenicol
#       col 'ssi.6.ii.s.2', p.ssi_questionnaire.get_appendix_antibiotics_at(1).others_fosfomycin
#       col 'ssi.6.ii.s.3', p.ssi_questionnaire.get_appendix_antibiotics_at(1).others_metronidazole
#       col 'ssi.6.ii.s.4', p.ssi_questionnaire.get_appendix_antibiotics_at(1).others_trimethoprim
    elsif p.prostate_biopsy?
      # I Patient characteristics
      col 'prostate_biopsy.age', p.biopsy_questionnaire.age
    
      col 'prostate_biopsy.antibiotics_preceding_months', p.biopsy_questionnaire.antibiotics_preceding_months
      col 'prostate_biopsy.antibiotics_type', p.biopsy_questionnaire.antibiotics_type
      col 'prostate_biopsy.antibiotics_dosage', p.biopsy_questionnaire.antibiotics_dosage
      col 'prostate_biopsy.antibiotics_duration', p.biopsy_questionnaire.antibiotics_duration
      col 'prostate_biopsy.antibiotics_route', p.biopsy_questionnaire.antibiotics_route
    
      col 'prostate_biopsy.urogenital_infection_preceding_months', p.biopsy_questionnaire.urogenital_infection_preceding_months
    
      col 'prostate_biopsy.urinary_catheter', p.biopsy_questionnaire.urinary_catheter
      col 'prostate_biopsy.urinary_catheter_duration', p.biopsy_questionnaire.urinary_catheter_duration
    
      col 'prostate_biopsy.prostate_size_measured', p.biopsy_questionnaire.prostate_size_measured
      col 'prostate_biopsy.prostate_size', p.biopsy_questionnaire.prostate_size
    
      col 'prostate_biopsy.diabetes_mellitus', p.biopsy_questionnaire.diabetes_mellitus
    
      # II Indication for biopsy
      col 'prostate_biopsy.psa', p.biopsy_questionnaire.psa
      col 'prostate_biopsy.psa_size', p.biopsy_questionnaire.psa_size
    
      col 'prostate_biopsy.repeated_biopsy', p.biopsy_questionnaire.repeated_biopsy
      col 'prostate_biopsy.repeated_biopsy_number_previous_procedures', p.biopsy_questionnaire.repeated_biopsy_number_previous_procedures
    
      # III Performance of biopsy
      col 'prostate_biopsy.preoperative_urine_examination', p.biopsy_questionnaire.preoperative_urine_examination
      col 'prostate_biopsy.preoperative_urine_examination_type', p.biopsy_questionnaire.preoperative_urine_examination_type
      col 'prostate_biopsy.preoperative_urine_culture_result', p.biopsy_questionnaire.preoperative_urine_culture_result

      col 'prostate_biopsy.preoperative_bowel_preparation', p.biopsy_questionnaire.preoperative_bowel_preparation
      col 'prostate_biopsy.preoperative_bowel_preparation_type', p.biopsy_questionnaire.preoperative_bowel_preparation_type

      col 'prostate_biopsy.antibiotic_prophylaxis', p.biopsy_questionnaire.antibiotic_prophylaxis
      col 'prostate_biopsy.antibiotic_prophylaxis_type', p.biopsy_questionnaire.antibiotic_prophylaxis_type
      col 'prostate_biopsy.antibiotic_prophylaxis_dosage', p.biopsy_questionnaire.antibiotic_prophylaxis_dosage
      col 'prostate_biopsy.antibiotic_prophylaxis_duration', p.biopsy_questionnaire.antibiotic_prophylaxis_duration
      col 'prostate_biopsy.antibiotic_prophylaxis_route', p.biopsy_questionnaire.antibiotic_prophylaxis_route

      col 'prostate_biopsy.biopsy_anesthesia', p.biopsy_questionnaire.biopsy_anesthesia
      col 'prostate_biopsy.biopsy_anesthesia_type', p.biopsy_questionnaire.biopsy_anesthesia_type

      col 'prostate_biopsy.biopsy_route', p.biopsy_questionnaire.biopsy_route

      col 'prostate_biopsy.number_cores_taken', p.biopsy_questionnaire.number_cores_taken

      col 'prostate_biopsy.preoperative_urine_culture.first_pathogen', p.biopsy_questionnaire.appendix_culture_result&.first_pathogen
      col 'prostate_biopsy.preoperative_urine_culture.first_pathogen_specify', p.biopsy_questionnaire.appendix_culture_result&.first_pathogen_specify
      col 'prostate_biopsy.preoperative_urine_culture.first_pathogen_enter_cfu_ml', p.biopsy_questionnaire.appendix_culture_result&.first_pathogen_enter_cfu_ml
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_ampicillin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_ampicillin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_ampicillin_bli', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_bli
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_ampicillin_bli_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_bli_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_piperacillin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_piperacillin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_piperacillin_bli', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_bli
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_piperacillin_bli_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_bli_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_oxacillin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_oxacillin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_oxacillin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_oxacillin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_ticarcillin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ticarcillin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_penicillins_ticarcillin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ticarcillin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cephazolin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cephazolin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cephazolin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cephazolin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefuroxime', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefuroxime
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefuroxime_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefuroxime_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefotaxime', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotaxime
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefotaxime_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotaxime_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_ceftazidime', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftazidime
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_ceftazidime_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftazidime_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefepime', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefepime
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefepime_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefepime_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_ceftaroline', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftaroline
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_ceftaroline_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftaroline_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefoxitin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefoxitin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefoxitin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefoxitin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefotetan', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotetan
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_cephalosporins_cefotetan_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotetan_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_carbapenem', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_carbapenem_imipenem', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_imipenem
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_carbapenem_imipenem_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_imipenem_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_carbapenem_doripenem', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_doripenem
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_carbapenem_doripenem_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_doripenem_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_carbapenem_ertapenem', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_ertapenem
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_carbapenem_ertapenem_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_ertapenem_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_aminoglycosides', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_aminoglycosides_gentamicin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_gentamicin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_aminoglycosides_gentamicin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_gentamicin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_aminoglycosides_amikacin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_amikacin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_aminoglycosides_amikacin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_amikacin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_aminoglycosides_tobramicin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_tobramicin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_aminoglycosides_tobramicin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_tobramicin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_aminoglycosides_netilmicin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_netilmicin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_aminoglycosides_netilmicin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_netilmicin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fluoroquinolones', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fluoroquinolones_ofloxacin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ofloxacin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fluoroquinolones_ofloxacin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ofloxacin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fluoroquinolones_ciprofloxacin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ciprofloxacin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fluoroquinolones_ciprofloxacin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ciprofloxacin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fluoroquinolones_levofloxacin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_levofloxacin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fluoroquinolones_levofloxacin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_levofloxacin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fluoroquinolones_moxifloxacin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_moxifloxacin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fluoroquinolones_moxifloxacin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_moxifloxacin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_tetracyclines', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_tetracyclines_doxycyclin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_doxycyclin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_tetracyclines_doxycyclin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_doxycyclin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_tetracyclines_tetracycline', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_tetracycline
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_tetracyclines_tetracycline_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_tetracycline_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_tetracyclines_minocycline', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_minocycline
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_tetracyclines_minocycline_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_minocycline_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_tetracyclines_glycylcylines', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_glycylcylines
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_tetracyclines_glycylcylines_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_glycylcylines_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fosfomycin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fosfomycin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fosfomycin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fosfomycin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_trimethoprim', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_trimethoprim
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_trimethoprim_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_trimethoprim_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_nitrofurantoin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_nitrofurantoin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_nitrofurantoin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_nitrofurantoin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_erythromycin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_erythromycin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_erythromycin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_erythromycin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_clindamycin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_clindamycin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_clindamycin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_clindamycin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_glycopeptides', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_glycopeptides_vancomycin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_vancomycin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_glycopeptides_vancomycin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_vancomycin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_glycopeptides_teicoplanin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_teicoplanin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_glycopeptides_teicoplanin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_teicoplanin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_glycopeptides_telavancin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_telavancin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_glycopeptides_telavancin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_telavancin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_linezolid', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_linezolid
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_linezolid_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_linezolid_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_phenicols', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_phenicols
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_phenicols_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_phenicols_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_polymixins', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_polymixins_colistins', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_colistins
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_polymixins_colistins_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_colistins_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_polymixins_polymixin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_polymixin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_polymixins_polymixin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_polymixin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_monobactams', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_monobactams
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_monobactams_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_monobactams_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_daptomycin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_daptomycin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_daptomycin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_daptomycin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_rifampin', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_rifampin
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_rifampin_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_rifampin_s
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fucidanes', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fucidanes
      col 'prostate_biopsy.preoperative_urine_culture.first_susceptibility_test_fucidanes_s', p.biopsy_questionnaire.appendix_culture_result&.first_susceptibility_test_fucidanes_s
      col 'prostate_biopsy.preoperative_urine_culture.second_pathogen', p.biopsy_questionnaire.appendix_culture_result&.second_pathogen
      col 'prostate_biopsy.preoperative_urine_culture.second_pathogen_specify', p.biopsy_questionnaire.appendix_culture_result&.second_pathogen_specify
      col 'prostate_biopsy.preoperative_urine_culture.second_pathogen_enter_cfu_ml', p.biopsy_questionnaire.appendix_culture_result&.second_pathogen_enter_cfu_ml
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_ampicillin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_ampicillin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_ampicillin_bli', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_bli
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_ampicillin_bli_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_bli_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_piperacillin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_piperacillin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_piperacillin_bli', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_bli
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_piperacillin_bli_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_bli_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_oxacillin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_oxacillin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_oxacillin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_oxacillin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_ticarcillin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ticarcillin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_penicillins_ticarcillin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ticarcillin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cephazolin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cephazolin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cephazolin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cephazolin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefuroxime', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefuroxime
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefuroxime_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefuroxime_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefotaxime', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotaxime
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefotaxime_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotaxime_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_ceftazidime', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftazidime
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_ceftazidime_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftazidime_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefepime', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefepime
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefepime_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefepime_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_ceftaroline', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftaroline
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_ceftaroline_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftaroline_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefoxitin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefoxitin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefoxitin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefoxitin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefotetan', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotetan
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_cephalosporins_cefotetan_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotetan_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_carbapenem', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_carbapenem_imipenem', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_imipenem
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_carbapenem_imipenem_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_imipenem_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_carbapenem_doripenem', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_doripenem
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_carbapenem_doripenem_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_doripenem_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_carbapenem_ertapenem', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_ertapenem
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_carbapenem_ertapenem_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_ertapenem_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_aminoglycosides', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_aminoglycosides_gentamicin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_gentamicin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_aminoglycosides_gentamicin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_gentamicin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_aminoglycosides_amikacin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_amikacin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_aminoglycosides_amikacin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_amikacin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_aminoglycosides_tobramicin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_tobramicin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_aminoglycosides_tobramicin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_tobramicin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_aminoglycosides_netilmicin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_netilmicin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_aminoglycosides_netilmicin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_netilmicin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fluoroquinolones', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fluoroquinolones_ofloxacin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ofloxacin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fluoroquinolones_ofloxacin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ofloxacin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fluoroquinolones_ciprofloxacin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ciprofloxacin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fluoroquinolones_ciprofloxacin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ciprofloxacin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fluoroquinolones_levofloxacin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_levofloxacin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fluoroquinolones_levofloxacin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_levofloxacin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fluoroquinolones_moxifloxacin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_moxifloxacin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fluoroquinolones_moxifloxacin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_moxifloxacin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_tetracyclines', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_tetracyclines_doxycyclin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_doxycyclin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_tetracyclines_doxycyclin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_doxycyclin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_tetracyclines_tetracycline', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_tetracycline
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_tetracyclines_tetracycline_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_tetracycline_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_tetracyclines_minocycline', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_minocycline
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_tetracyclines_minocycline_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_minocycline_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_tetracyclines_glycylcylines', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_glycylcylines
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_tetracyclines_glycylcylines_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_glycylcylines_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fosfomycin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fosfomycin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fosfomycin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fosfomycin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_trimethoprim', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_trimethoprim
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_trimethoprim_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_trimethoprim_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_nitrofurantoin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_nitrofurantoin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_nitrofurantoin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_nitrofurantoin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_erythromycin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_erythromycin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_erythromycin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_erythromycin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_clindamycin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_clindamycin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_clindamycin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_clindamycin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_glycopeptides', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_glycopeptides_vancomycin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_vancomycin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_glycopeptides_vancomycin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_vancomycin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_glycopeptides_teicoplanin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_teicoplanin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_glycopeptides_teicoplanin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_teicoplanin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_glycopeptides_telavancin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_telavancin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_glycopeptides_telavancin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_telavancin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_linezolid', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_linezolid
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_linezolid_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_linezolid_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_phenicols', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_phenicols
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_phenicols_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_phenicols_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_polymixins', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_polymixins_colistins', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_colistins
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_polymixins_colistins_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_colistins_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_polymixins_polymixin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_polymixin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_polymixins_polymixin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_polymixin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_monobactams', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_monobactams
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_monobactams_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_monobactams_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_daptomycin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_daptomycin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_daptomycin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_daptomycin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_rifampin', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_rifampin
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_rifampin_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_rifampin_s
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fucidanes', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fucidanes
      col 'prostate_biopsy.preoperative_urine_culture.second_susceptibility_test_fucidanes_s', p.biopsy_questionnaire.appendix_culture_result&.second_susceptibility_test_fucidanes_s

      col 'prostate_biopsy_outcome.histopathology_analysis', p.biopsy_outcome_questionnaire.histopathology_analysis
      col 'prostate_biopsy_outcome.histopathology_biopsy_material_change', p.biopsy_outcome_questionnaire.histopathology_biopsy_material_change
      col 'prostate_biopsy_outcome.histopathology_biopsy_material_change_severity', p.biopsy_outcome_questionnaire.histopathology_biopsy_material_change_severity

      col 'prostate_biopsy_outcome.outcome_analysis', p.biopsy_outcome_questionnaire.outcome_analysis
      col 'prostate_biopsy_outcome.outcome_analysis_form_control_visit', p.biopsy_outcome_questionnaire.outcome_analysis_form_control_visit
      col 'prostate_biopsy_outcome.outcome_analysis_urinary_tract_infection', p.biopsy_outcome_questionnaire.outcome_analysis_urinary_tract_infection
      col 'prostate_biopsy_outcome.outcome_analysis_dysuria', p.biopsy_outcome_questionnaire.outcome_analysis_dysuria
      col 'prostate_biopsy_outcome.outcome_analysis_frequency', p.biopsy_outcome_questionnaire.outcome_analysis_frequency
      col 'prostate_biopsy_outcome.outcome_analysis_urgency', p.biopsy_outcome_questionnaire.outcome_analysis_urgency
      col 'prostate_biopsy_outcome.outcome_analysis_prostate_pain', p.biopsy_outcome_questionnaire.outcome_analysis_prostate_pain
      col 'prostate_biopsy_outcome.outcome_analysis_rigor', p.biopsy_outcome_questionnaire.outcome_analysis_rigor
      col 'prostate_biopsy_outcome.outcome_analysis_loin_pain', p.biopsy_outcome_questionnaire.outcome_analysis_loin_pain
      col 'prostate_biopsy_outcome.outcome_analysis_fever', p.biopsy_outcome_questionnaire.outcome_analysis_fever
      col 'prostate_biopsy_outcome.physician_visit', p.biopsy_outcome_questionnaire.physician_visit
      col 'prostate_biopsy_outcome.physician_visit_care_clinician', p.biopsy_outcome_questionnaire.physician_visit_care_clinician
      col 'prostate_biopsy_outcome.physician_visit_emergency_room', p.biopsy_outcome_questionnaire.physician_visit_emergency_room
      col 'prostate_biopsy_outcome.physician_visit_admission_hospital', p.biopsy_outcome_questionnaire.physician_visit_admission_hospital
      col 'prostate_biopsy_outcome.physician_visit_admission_hospital_urology', p.biopsy_outcome_questionnaire.physician_visit_admission_hospital_urology
      col 'prostate_biopsy_outcome.physician_visit_admission_hospital_internal_medicine', p.biopsy_outcome_questionnaire.physician_visit_admission_hospital_internal_medicine
      col 'prostate_biopsy_outcome.physician_visit_admission_hospital_intensive_care', p.biopsy_outcome_questionnaire.physician_visit_admission_hospital_intensive_care
      col 'prostate_biopsy_outcome.physician_visit_psa', p.biopsy_outcome_questionnaire.physician_visit_psa
      col 'prostate_biopsy_outcome.physician_visit_psa_value', p.biopsy_outcome_questionnaire.physician_visit_psa_value
      col 'prostate_biopsy_outcome.physician_visit_wbc_count', p.biopsy_outcome_questionnaire.physician_visit_wbc_count
      col 'prostate_biopsy_outcome.physician_visit_wbc_value', p.biopsy_outcome_questionnaire.physician_visit_wbc_value
      col 'prostate_biopsy_outcome.physician_visit_crp', p.biopsy_outcome_questionnaire.physician_visit_crp
      col 'prostate_biopsy_outcome.physician_visit_crp_value', p.biopsy_outcome_questionnaire.physician_visit_crp_value
      col 'prostate_biopsy_outcome.physician_visit_urine_culture', p.biopsy_outcome_questionnaire.physician_visit_urine_culture
      col 'prostate_biopsy_outcome.physician_visit_urine_culture_result', p.biopsy_outcome_questionnaire.physician_visit_urine_culture_result

      col 'prostate_biopsy_outcome.antibiotic_treatment', p.biopsy_outcome_questionnaire.antibiotic_treatment
      col 'prostate_biopsy_outcome.antibiotics_type', p.biopsy_outcome_questionnaire.antibiotics_type
      col 'prostate_biopsy_outcome.antibiotics_dosage', p.biopsy_outcome_questionnaire.antibiotics_dosage
      col 'prostate_biopsy_outcome.antibiotics_duration', p.biopsy_outcome_questionnaire.antibiotics_duration
      col 'prostate_biopsy_outcome.antibiotics_route', p.biopsy_outcome_questionnaire.antibiotics_route

      col 'prostate_biopsy_outcome.outcome', p.biopsy_outcome_questionnaire.outcome

      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_pathogen', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_pathogen
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_pathogen_specify', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_pathogen_specify
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_pathogen_enter_cfu_ml', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_pathogen_enter_cfu_ml
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_ampicillin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_ampicillin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_ampicillin_bli', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_bli
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_ampicillin_bli_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ampicillin_bli_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_piperacillin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_piperacillin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_piperacillin_bli', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_bli
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_piperacillin_bli_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_piperacillin_bli_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_oxacillin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_oxacillin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_oxacillin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_oxacillin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_ticarcillin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ticarcillin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_penicillins_ticarcillin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_penicillins_ticarcillin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cephazolin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cephazolin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cephazolin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cephazolin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefuroxime', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefuroxime
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefuroxime_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefuroxime_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefotaxime', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotaxime
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefotaxime_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotaxime_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_ceftazidime', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftazidime
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_ceftazidime_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftazidime_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefepime', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefepime
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefepime_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefepime_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_ceftaroline', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftaroline
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_ceftaroline_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_ceftaroline_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefoxitin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefoxitin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefoxitin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefoxitin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefotetan', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotetan
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_cephalosporins_cefotetan_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_cephalosporins_cefotetan_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_carbapenem', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_carbapenem_imipenem', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_imipenem
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_carbapenem_imipenem_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_imipenem_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_carbapenem_doripenem', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_doripenem
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_carbapenem_doripenem_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_doripenem_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_carbapenem_ertapenem', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_ertapenem
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_carbapenem_ertapenem_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_carbapenem_ertapenem_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_aminoglycosides', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_aminoglycosides_gentamicin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_gentamicin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_aminoglycosides_gentamicin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_gentamicin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_aminoglycosides_amikacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_amikacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_aminoglycosides_amikacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_amikacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_aminoglycosides_tobramicin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_tobramicin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_aminoglycosides_tobramicin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_tobramicin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_aminoglycosides_netilmicin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_netilmicin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_aminoglycosides_netilmicin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_aminoglycosides_netilmicin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fluoroquinolones', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fluoroquinolones_ofloxacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ofloxacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fluoroquinolones_ofloxacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ofloxacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fluoroquinolones_ciprofloxacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ciprofloxacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fluoroquinolones_ciprofloxacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_ciprofloxacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fluoroquinolones_levofloxacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_levofloxacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fluoroquinolones_levofloxacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_levofloxacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fluoroquinolones_moxifloxacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_moxifloxacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fluoroquinolones_moxifloxacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fluoroquinolones_moxifloxacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_tetracyclines', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_tetracyclines_doxycyclin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_doxycyclin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_tetracyclines_doxycyclin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_doxycyclin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_tetracyclines_tetracycline', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_tetracycline
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_tetracyclines_tetracycline_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_tetracycline_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_tetracyclines_minocycline', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_minocycline
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_tetracyclines_minocycline_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_minocycline_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_tetracyclines_glycylcylines', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_glycylcylines
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_tetracyclines_glycylcylines_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_tetracyclines_glycylcylines_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fosfomycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fosfomycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fosfomycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fosfomycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_trimethoprim', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_trimethoprim
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_trimethoprim_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_trimethoprim_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_nitrofurantoin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_nitrofurantoin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_nitrofurantoin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_nitrofurantoin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_erythromycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_erythromycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_erythromycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_erythromycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_clindamycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_clindamycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_clindamycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_clindamycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_glycopeptides', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_glycopeptides_vancomycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_vancomycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_glycopeptides_vancomycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_vancomycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_glycopeptides_teicoplanin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_teicoplanin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_glycopeptides_teicoplanin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_teicoplanin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_glycopeptides_telavancin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_telavancin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_glycopeptides_telavancin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_glycopeptides_telavancin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_linezolid', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_linezolid
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_linezolid_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_linezolid_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_phenicols', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_phenicols
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_phenicols_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_phenicols_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_polymixins', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_polymixins_colistins', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_colistins
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_polymixins_colistins_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_colistins_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_polymixins_polymixin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_polymixin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_polymixins_polymixin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_polymixins_polymixin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_monobactams', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_monobactams
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_monobactams_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_monobactams_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_daptomycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_daptomycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_daptomycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_daptomycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_rifampin', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_rifampin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_rifampin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_rifampin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fucidanes', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fucidanes
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.first_susceptibility_test_fucidanes_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.first_susceptibility_test_fucidanes_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_pathogen', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_pathogen
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_pathogen_specify', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_pathogen_specify
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_pathogen_enter_cfu_ml', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_pathogen_enter_cfu_ml
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_ampicillin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_ampicillin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_ampicillin_bli', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_bli
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_ampicillin_bli_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ampicillin_bli_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_piperacillin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_piperacillin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_piperacillin_bli', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_bli
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_piperacillin_bli_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_piperacillin_bli_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_oxacillin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_oxacillin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_oxacillin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_oxacillin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_ticarcillin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ticarcillin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_penicillins_ticarcillin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_penicillins_ticarcillin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cephazolin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cephazolin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cephazolin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cephazolin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefuroxime', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefuroxime
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefuroxime_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefuroxime_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefotaxime', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotaxime
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefotaxime_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotaxime_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_ceftazidime', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftazidime
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_ceftazidime_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftazidime_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefepime', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefepime
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefepime_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefepime_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_ceftaroline', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftaroline
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_ceftaroline_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_ceftaroline_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefoxitin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefoxitin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefoxitin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefoxitin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefotetan', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotetan
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_cephalosporins_cefotetan_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_cephalosporins_cefotetan_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_carbapenem', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_carbapenem_imipenem', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_imipenem
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_carbapenem_imipenem_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_imipenem_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_carbapenem_doripenem', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_doripenem
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_carbapenem_doripenem_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_doripenem_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_carbapenem_ertapenem', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_ertapenem
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_carbapenem_ertapenem_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_carbapenem_ertapenem_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_aminoglycosides', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_aminoglycosides_gentamicin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_gentamicin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_aminoglycosides_gentamicin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_gentamicin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_aminoglycosides_amikacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_amikacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_aminoglycosides_amikacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_amikacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_aminoglycosides_tobramicin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_tobramicin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_aminoglycosides_tobramicin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_tobramicin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_aminoglycosides_netilmicin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_netilmicin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_aminoglycosides_netilmicin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_aminoglycosides_netilmicin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fluoroquinolones', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fluoroquinolones_ofloxacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ofloxacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fluoroquinolones_ofloxacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ofloxacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fluoroquinolones_ciprofloxacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ciprofloxacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fluoroquinolones_ciprofloxacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_ciprofloxacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fluoroquinolones_levofloxacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_levofloxacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fluoroquinolones_levofloxacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_levofloxacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fluoroquinolones_moxifloxacin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_moxifloxacin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fluoroquinolones_moxifloxacin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fluoroquinolones_moxifloxacin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_tetracyclines', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_tetracyclines_doxycyclin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_doxycyclin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_tetracyclines_doxycyclin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_doxycyclin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_tetracyclines_tetracycline', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_tetracycline
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_tetracyclines_tetracycline_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_tetracycline_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_tetracyclines_minocycline', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_minocycline
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_tetracyclines_minocycline_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_minocycline_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_tetracyclines_glycylcylines', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_glycylcylines
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_tetracyclines_glycylcylines_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_tetracyclines_glycylcylines_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fosfomycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fosfomycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fosfomycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fosfomycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_trimethoprim', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_trimethoprim
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_trimethoprim_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_trimethoprim_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_nitrofurantoin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_nitrofurantoin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_nitrofurantoin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_nitrofurantoin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_erythromycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_erythromycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_erythromycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_erythromycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_clindamycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_clindamycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_clindamycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_clindamycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_glycopeptides', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_glycopeptides_vancomycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_vancomycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_glycopeptides_vancomycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_vancomycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_glycopeptides_teicoplanin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_teicoplanin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_glycopeptides_teicoplanin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_teicoplanin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_glycopeptides_telavancin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_telavancin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_glycopeptides_telavancin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_glycopeptides_telavancin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_linezolid', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_linezolid
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_linezolid_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_linezolid_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_phenicols', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_phenicols
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_phenicols_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_phenicols_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_polymixins', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_polymixins_colistins', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_colistins
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_polymixins_colistins_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_colistins_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_polymixins_polymixin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_polymixin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_polymixins_polymixin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_polymixins_polymixin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_monobactams', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_monobactams
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_monobactams_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_monobactams_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_daptomycin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_daptomycin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_daptomycin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_daptomycin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_rifampin', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_rifampin
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_rifampin_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_rifampin_s
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fucidanes', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fucidanes
      col 'prostate_biopsy_outcome.physician_visit_urine_culture.second_susceptibility_test_fucidanes_s', p.biopsy_outcome_questionnaire.appendix_culture_result&.second_susceptibility_test_fucidanes_s
    end
  end
end

