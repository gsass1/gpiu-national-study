module DepartmentQuestionnairesHelper
  def antimicrobial_prophylaxis_list
    {
      I18n.t('department_questionnaires.antibiotics_table.label.diagnostic_procedures') =>
      [
        I18n.t('department_questionnaires.antibiotics_table.label.cystoscopy'),
        I18n.t('department_questionnaires.antibiotics_table.label.ureterorenoscopy'),
        I18n.t('department_questionnaires.antibiotics_table.label.prostate_biopsies_transrectal')
      ],
      I18n.t('department_questionnaires.antibiotics_table.label.minor_open_surgery') =>
      [
        I18n.t('department_questionnaires.antibiotics_table.label.vasectomy'),
        I18n.t('department_questionnaires.antibiotics_table.label.inguinal_scrotal_and_penile_surgery'),
        I18n.t('department_questionnaires.antibiotics_table.label.retroperitoneal_lymph_node_dissection')
      ],
      I18n.t('department_questionnaires.antibiotics_table.label.endoscopic_surgery_and_eswl') =>
      [
        I18n.t('department_questionnaires.antibiotics_table.label.resection_of_the_prostate_turp'),
        I18n.t('department_questionnaires.antibiotics_table.label.resection_of_bladder_tumour'),
        I18n.t('department_questionnaires.antibiotics_table.label.ureterorenoscopy_with_stone_treatment'),
        I18n.t('department_questionnaires.antibiotics_table.label.percutaneous_nephrolithotripsy'),
        I18n.t('department_questionnaires.antibiotics_table.label.eswl')
      ],
      I18n.t('department_questionnaires.antibiotics_table.label.major_open_surgery') =>
      [
        I18n.t('department_questionnaires.antibiotics_table.label.open_prostatectomy_for_bph'),
        I18n.t('department_questionnaires.antibiotics_table.label.simple_nefrectomy'),
        I18n.t('department_questionnaires.antibiotics_table.label.radical_nefrectomy'),
        I18n.t('department_questionnaires.antibiotics_table.label.radical_retropubic_prostatectomy'),
        I18n.t('department_questionnaires.antibiotics_table.label.cystectomy_and_urinary_diversion_bladder_replacement')
      ],
      I18n.t('department_questionnaires.antibiotics_table.label.laparoscopic_and_robot_assisted_procedures') =>
      [
        I18n.t('department_questionnaires.antibiotics_table.label.on_kidney_and_abdominal_testes'),
        I18n.t('department_questionnaires.antibiotics_table.label.lymph_node_dissection'),
        I18n.t('department_questionnaires.antibiotics_table.label.prostatectomy'),
        I18n.t('department_questionnaires.antibiotics_table.label.cystectomy_with_bladder_replacement')
      ]
    }
  end
end
