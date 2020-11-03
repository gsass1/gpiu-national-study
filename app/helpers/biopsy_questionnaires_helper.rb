module BiopsyQuestionnairesHelper
  def antibiotic_groups
    {
      I18n.t('shared.appendix_antibiotic.aminoglycosides.group') =>
          [
            [I18n.t('shared.appendix_antibiotic.aminoglycosides.gentamicin'), "Gentamicin"],
            [I18n.t('shared.appendix_antibiotic.aminoglycosides.amikacin'), "Amikacin"],
            [I18n.t('shared.appendix_antibiotic.aminoglycosides.other'), "Other"],
          ],
      I18n.t('shared.appendix_antibiotic.carbapenems.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.carbapenems.ertapenem'), "Ertapenem"],
              [I18n.t('shared.appendix_antibiotic.carbapenems.imipenem'), "Imipenem"],
              [I18n.t('shared.appendix_antibiotic.carbapenems.doripenem'), "Doripenem"],
              [I18n.t('shared.appendix_antibiotic.carbapenems.meropenem'), "Meropenem"],
          ],
      I18n.t('shared.appendix_antibiotic.first_generation_cephalosporins.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.first_generation_cephalosporins.cefadroxil'), "Cefadroxil"],
              [I18n.t('shared.appendix_antibiotic.first_generation_cephalosporins.cefazolin'), "Cefazolin"],
              [I18n.t('shared.appendix_antibiotic.first_generation_cephalosporins.cefalexin'), "Cefalexin"],
          ],
      I18n.t('shared.appendix_antibiotic.second_generation_cephalosporins.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.second_generation_cephalosporins.cefaclor'), "Cefaclor"],
              [I18n.t('shared.appendix_antibiotic.second_generation_cephalosporins.cefprozil'), "Cefprozil"],
              [I18n.t('shared.appendix_antibiotic.second_generation_cephalosporins.cefuroxime'), "Cefuroxime"],
          ],
      I18n.t('shared.appendix_antibiotic.third_generation_cephalosporins.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporins.cefixim'), "Cefixim"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporins.cefdinir'), "Cefdinir"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporins.cefotaxime'), "Cefotaxime"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporins.cefpodoxime'), "Cefpodoxime"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporins.ceftazidime'), "Ceftazidime"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporins.ceftibuten'), "Ceftibuten"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporins.ceftriaxone'), "Ceftriaxone"],
          ],
      I18n.t('shared.appendix_antibiotic.forth_generation_cephalosporins.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.forth_generation_cephalosporins.cefepime'), "Cefepime"],
          ],
      I18n.t('shared.appendix_antibiotic.fifth_generation_cephalosporins.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.fifth_generation_cephalosporins.ceftaroline_fosamil'), "Ceftaroline\ fosamil"],
              [I18n.t('shared.appendix_antibiotic.fifth_generation_cephalosporins.ceftobiprole'), "Ceftobiprole"],
          ],
      I18n.t('shared.appendix_antibiotic.glycopeptides.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.glycopeptides.teicoplanin'), "Teicoplanin"],
              [I18n.t('shared.appendix_antibiotic.glycopeptides.vancomycin'), "Vancomycin"],
              [I18n.t('shared.appendix_antibiotic.glycopeptides.telavancin'), "Telavancin"],
          ],
      I18n.t('shared.appendix_antibiotic.lincosamides.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.lincosamides.clindamycin'), "Clindamycin"],
              [I18n.t('shared.appendix_antibiotic.lincosamides.lincomycin'), "Lincomycin"],
          ],
      I18n.t('shared.appendix_antibiotic.macrolides.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.macrolides.azithromycin'), "Azithromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolides.clarithromycin'), "Clarithromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolides.erythromycin'), "Erythromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolides.roxithromycin'), "Roxithromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolides.telithromycin'), "Telithromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolides.spiramycin'), "Spiramycin"],
          ],
      I18n.t('shared.appendix_antibiotic.monobactams.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.monobactams.aztreonam'), "Aztreonam"],
          ],
      I18n.t('shared.appendix_antibiotic.nitrofurans.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.nitrofurans.furazolidine'), "Furazolidine"],
              [I18n.t('shared.appendix_antibiotic.nitrofurans.nitrofurantoin'), "Nitrofurantoin"],
          ],
      I18n.t('shared.appendix_antibiotic.penicillins.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.penicillins.amoxicillin'), "Amoxicillin"],
              [I18n.t('shared.appendix_antibiotic.penicillins.ampicillin'), "Ampicillin"],
              [I18n.t('shared.appendix_antibiotic.penicillins.nafcillin'), "Nafcillin"],
              [I18n.t('shared.appendix_antibiotic.penicillins.oxacillin'), "Oxacillin"],
              [I18n.t('shared.appendix_antibiotic.penicillins.ticarcillin'), "Ticarcillin"],
              [I18n.t('shared.appendix_antibiotic.penicillins.penicillin_g'), "Penicillin G "],
              [I18n.t('shared.appendix_antibiotic.penicillins.methicillin'), "Methicillin"],
          ],
      I18n.t('shared.appendix_antibiotic.penicillins.penicillin_combinations.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.penicillins.penicillin_combinations.amoxicillin_clavulunate'), "Amoxicillin/clavulunate"],
              [I18n.t('shared.appendix_antibiotic.penicillins.penicillin_combinations.ampicillin_sulbactam'), "Ampicillin/sulbactam"],
              [I18n.t('shared.appendix_antibiotic.penicillins.penicillin_combinations.piperacillin_tazobactam'), "Piperacillin/tazobactam"],
              [I18n.t('shared.appendix_antibiotic.penicillins.penicillin_combinations.ticarcillin_claculunate'), "Ticarcillin/claculunate"],
          ],
      I18n.t('shared.appendix_antibiotic.polypeptides.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.polypeptides.bacitracin'), "Bacitracin"],
              [I18n.t('shared.appendix_antibiotic.polypeptides.colistin'), "Colistin"],
              [I18n.t('shared.appendix_antibiotic.polypeptides.polymycin_b'), "Polymyxin-B"],
          ],
      I18n.t('shared.appendix_antibiotic.quinolones.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.quinolones.ciprofloxacin'), "Ciprofloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolones.enoxacin'), "Enoxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolones.gatifloxacin'), "Gatifloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolones.gemifloxacin'), "Gemifloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolones.levofloxacin'), "Levofloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolones.lomefloxacin'), "Lomefloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolones.moxifloxacin'), "Moxifloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolones.nalidixic_acid'), "Nalidixic acid"],
              [I18n.t('shared.appendix_antibiotic.quinolones.norfloxacin'), "Norfloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolones.ofloxacin'), "Ofloxacin"],
          ],
      I18n.t('shared.appendix_antibiotic.sulfonamides.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.sulfonamides.sulfamethoxazole'), "Sulfamethoxazole"],
              [I18n.t('shared.appendix_antibiotic.sulfonamides.trimephtoprim_sulfamethoxazole'), "Trimephtoprim-\ Sulfamethoxazole"],
          ],
      I18n.t('shared.appendix_antibiotic.tetracyclines.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.tetracyclines.doxycycline'), "Doxycycline"],
              [I18n.t('shared.appendix_antibiotic.tetracyclines.tetracycline'), "Tetracycline"],
          ],
      I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.clofazimine'), "Clofazimine"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.dapsone'), "Dapsone"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.capreomycin'), "Capreomycin"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.cycloserine'), "Cycloserine"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.ethembutol'), "Ethembutol"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.ethionamide'), "Ethionamide"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.isoniazid'), "Isoniazid"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.pyranizamide'), "Pyranizamide"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.rifampicin'), "Rifampicin"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drugs.streptomycin'), "Streptomycin"],
          ],
      I18n.t('shared.appendix_antibiotic.other_drugs.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.other_drugs.chloramphenicol'), "Chloramphenicol"],
              [I18n.t('shared.appendix_antibiotic.other_drugs.fosfomycin'), "Fosfomycin"],
              [I18n.t('shared.appendix_antibiotic.other_drugs.metronidazole'), "Metronidazole"],
              [I18n.t('shared.appendix_antibiotic.other_drugs.trimethoprim'), "Trimethoprim"],
          ]
  }
  end
end
