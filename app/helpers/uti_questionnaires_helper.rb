# frozen_string_literal: true

module UtiQuestionnairesHelper
  def pathogen_options
    {
      I18n.t('shared.appendix_culture.pathogen_options.enterobacteriaceae') => [
        [I18n.t('shared.appendix_culture.pathogen_options.e_coli'), 'E. coli'],
        [I18n.t('shared.appendix_culture.pathogen_options.klebsiella_sp'), 'Klebsiella sp.'],
        [I18n.t('shared.appendix_culture.pathogen_options.proteus_sp'), 'Proteus sp.'],
        [I18n.t('shared.appendix_culture.pathogen_options.enterobacter_sp'), 'Enterobacter sp.'],
        [I18n.t('shared.appendix_culture.pathogen_options.citrobacter_sp'), 'Citrobacter sp.'],
        [I18n.t('shared.appendix_culture.pathogen_options.morganella_sp'), 'Morganella sp.'],
        [I18n.t('shared.appendix_culture.pathogen_options.other_enterobacteriaceae'), 'Other enterobacteriaceae.']
      ],
      I18n.t('shared.appendix_culture.pathogen_options.non_fermenter') => [
        [I18n.t('shared.appendix_culture.pathogen_options.pseudomonas_aeruginosa'), 'Pseudomonas aeruginosa'],
        [I18n.t('shared.appendix_culture.pathogen_options.acinetoacter_sp'), 'Acinetoacter sp.'],
        [I18n.t('shared.appendix_culture.pathogen_options.other_non_fermenter'), 'Other non-fermenter.']
      ],
      I18n.t('shared.appendix_culture.pathogen_options.gram_positive_cocci') => [
        [I18n.t('shared.appendix_culture.pathogen_options.enterococcus_sp'), 'Enterococcus sp.'],
        [I18n.t('shared.appendix_culture.pathogen_options.staphylococcus_aureus'), 'Staphylococcus aureus'],
        [I18n.t('shared.appendix_culture.pathogen_options.caogulase_negative_staphylococcy_cns'),
         'Coagulase-negative staphylococci (CNS)'],
        [I18n.t('shared.appendix_culture.pathogen_options.other_gram_positive_cocci'), 'Other gram-positive cocci.']
      ],
      I18n.t('shared.appendix_culture.pathogen_options.other_bacteria') => [
        [I18n.t('shared.appendix_culture.pathogen_options.other_bacteria_option'), 'Other bacteria']
      ],
      I18n.t('shared.appendix_culture.pathogen_options.fungi') => [
        [I18n.t('shared.appendix_culture.pathogen_options.candida_sp'), 'Candida sp.'],
        [I18n.t('shared.appendix_culture.pathogen_options.other_fungi'), 'Other fungi.']
      ]
    }
  end
end
