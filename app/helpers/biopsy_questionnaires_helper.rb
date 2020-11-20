module BiopsyQuestionnairesHelper
  def antibiotic_groups
    {
      I18n.t('shared.appendix_antibiotic.aminoglycoside.group') =>
          [
            [I18n.t('shared.appendix_antibiotic.aminoglycoside.gentamicin'), "Gentamicin"],
            [I18n.t('shared.appendix_antibiotic.aminoglycoside.amikacin'), "Amikacin"],
            [I18n.t('shared.appendix_antibiotic.aminoglycoside.other'), "Other"],
          ],
      I18n.t('shared.appendix_antibiotic.carbapenem.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.carbapenem.ertapenem'), "Ertapenem"],
              [I18n.t('shared.appendix_antibiotic.carbapenem.imipenem'), "Imipenem"],
              [I18n.t('shared.appendix_antibiotic.carbapenem.doripenem'), "Doripenem"],
              [I18n.t('shared.appendix_antibiotic.carbapenem.meropenem'), "Meropenem"],
          ],
      I18n.t('shared.appendix_antibiotic.first_generation_cephalosporin.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.first_generation_cephalosporin.cefadroxil'), "Cefadroxil"],
              [I18n.t('shared.appendix_antibiotic.first_generation_cephalosporin.cefazolin'), "Cefazolin"],
              [I18n.t('shared.appendix_antibiotic.first_generation_cephalosporin.cefalexin'), "Cefalexin"],
          ],
      I18n.t('shared.appendix_antibiotic.second_generation_cephalosporin.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.second_generation_cephalosporin.cefaclor'), "Cefaclor"],
              [I18n.t('shared.appendix_antibiotic.second_generation_cephalosporin.cefprozil'), "Cefprozil"],
              [I18n.t('shared.appendix_antibiotic.second_generation_cephalosporin.cefuroxime'), "Cefuroxime"],
          ],
      I18n.t('shared.appendix_antibiotic.third_generation_cephalosporin.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporin.cefixim'), "Cefixim"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporin.cefdinir'), "Cefdinir"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporin.cefotaxime'), "Cefotaxime"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporin.cefpodoxime'), "Cefpodoxime"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporin.ceftazidime'), "Ceftazidime"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporin.ceftibuten'), "Ceftibuten"],
              [I18n.t('shared.appendix_antibiotic.third_generation_cephalosporin.ceftriaxone'), "Ceftriaxone"],
          ],
      I18n.t('shared.appendix_antibiotic.fourth_generation_cephalosporin.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.fourth_generation_cephalosporin.cefepime'), "Cefepime"],
          ],
      I18n.t('shared.appendix_antibiotic.fifth_generation_cephalosporin.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.fifth_generation_cephalosporin.ceftaroline_fosamil'), "Ceftaroline\ fosamil"],
              [I18n.t('shared.appendix_antibiotic.fifth_generation_cephalosporin.ceftobiprole'), "Ceftobiprole"],
          ],
      I18n.t('shared.appendix_antibiotic.glycopeptide.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.glycopeptide.teicoplanin'), "Teicoplanin"],
              [I18n.t('shared.appendix_antibiotic.glycopeptide.vancomycin'), "Vancomycin"],
              [I18n.t('shared.appendix_antibiotic.glycopeptide.telavancin'), "Telavancin"],
          ],
      I18n.t('shared.appendix_antibiotic.licosamide.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.licosamide.clindamycin'), "Clindamycin"],
              [I18n.t('shared.appendix_antibiotic.licosamide.lincomycin'), "Lincomycin"],
          ],
      I18n.t('shared.appendix_antibiotic.macrolide.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.macrolide.azithromycin'), "Azithromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolide.clarithromycin'), "Clarithromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolide.erythromycin'), "Erythromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolide.roxithromycin'), "Roxithromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolide.telithromycin'), "Telithromycin"],
              [I18n.t('shared.appendix_antibiotic.macrolide.spiramycin'), "Spiramycin"],
          ],
      I18n.t('shared.appendix_antibiotic.monobactam.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.monobactam.aztreonam'), "Aztreonam"],
          ],
      I18n.t('shared.appendix_antibiotic.nitrofuran.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.nitrofuran.furazolidine'), "Furazolidine"],
              [I18n.t('shared.appendix_antibiotic.nitrofuran.nitrofurantoin'), "Nitrofurantoin"],
          ],
      I18n.t('shared.appendix_antibiotic.penicillin.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.penicillin.amoxicillin'), "Amoxicillin"],
              [I18n.t('shared.appendix_antibiotic.penicillin.ampicillin'), "Ampicillin"],
              [I18n.t('shared.appendix_antibiotic.penicillin.nafcillin'), "Nafcillin"],
              [I18n.t('shared.appendix_antibiotic.penicillin.oxacillin'), "Oxacillin"],
              [I18n.t('shared.appendix_antibiotic.penicillin.ticarcillin'), "Ticarcillin"],
              [I18n.t('shared.appendix_antibiotic.penicillin.penicillin_g'), "Penicillin G "],
              [I18n.t('shared.appendix_antibiotic.penicillin.methicillin'), "Methicillin"],
              [I18n.t('shared.appendix_antibiotic.penicillin.amoxicillin_clavulunate'), "Amoxicillin/clavulunate"],
              [I18n.t('shared.appendix_antibiotic.penicillin.ampicillin_sulbactam'), "Ampicillin/sulbactam"],
              [I18n.t('shared.appendix_antibiotic.penicillin.piperacillin_tazobactam'), "Piperacillin/tazobactam"],
              [I18n.t('shared.appendix_antibiotic.penicillin.ticarcillin_claculunate'), "Ticarcillin/claculunate"],
          ],
      I18n.t('shared.appendix_antibiotic.polypeptide.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.polypeptide.bacitracin'), "Bacitracin"],
              [I18n.t('shared.appendix_antibiotic.polypeptide.colistin'), "Colistin"],
              [I18n.t('shared.appendix_antibiotic.polypeptide.polymycin_b'), "Polymyxin-B"],
          ],
      I18n.t('shared.appendix_antibiotic.quinolone.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.quinolone.ciprofloxacin'), "Ciprofloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolone.enoxacin'), "Enoxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolone.gatifloxacin'), "Gatifloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolone.gemifloxacin'), "Gemifloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolone.levofloxacin'), "Levofloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolone.lomefloxacin'), "Lomefloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolone.moxifloxacin'), "Moxifloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolone.nalidixic_acid'), "Nalidixic acid"],
              [I18n.t('shared.appendix_antibiotic.quinolone.norfloxacin'), "Norfloxacin"],
              [I18n.t('shared.appendix_antibiotic.quinolone.ofloxacin'), "Ofloxacin"],
          ],
      I18n.t('shared.appendix_antibiotic.sulfonamide.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.sulfonamide.sulfamethoxazole'), "Sulfamethoxazole"],
              [I18n.t('shared.appendix_antibiotic.sulfonamide.trimephtoprim_sulfamethoxazole'), "Trimephtoprim-\ Sulfamethoxazole"],
          ],
      I18n.t('shared.appendix_antibiotic.tetracycline.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.tetracycline.doxycycline'), "Doxycycline"],
              [I18n.t('shared.appendix_antibiotic.tetracycline.tetracycline'), "Tetracycline"],
          ],
      I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.clofazimine'), "Clofazimine"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.dapsone'), "Dapsone"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.capreomycin'), "Capreomycin"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.cycloserine'), "Cycloserine"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.ethembutol'), "Ethembutol"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.ethionamide'), "Ethionamide"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.isoniazid'), "Isoniazid"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.pyranizamide'), "Pyranizamide"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.rifampicin'), "Rifampicin"],
              [I18n.t('shared.appendix_antibiotic.antimycobacterial_drug.streptomycin'), "Streptomycin"],
          ],
      I18n.t('shared.appendix_antibiotic.other_drug.group') =>
          [
              [I18n.t('shared.appendix_antibiotic.other_drug.chloramphenicol'), "Chloramphenicol"],
              [I18n.t('shared.appendix_antibiotic.other_drug.fosfomycin'), "Fosfomycin"],
              [I18n.t('shared.appendix_antibiotic.other_drug.metronidazole'), "Metronidazole"],
              [I18n.t('shared.appendix_antibiotic.other_drugs.trimethoprim'), "Trimethoprim"],
          ]
  }
  end
end
