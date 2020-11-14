class AppendixAntibiotic < ApplicationRecord
  include Discard::Model

  GROUPS = [
    :aminoglycoside,
    :carbapenem,
    :first_generation_cephalosporin,
    :second_generation_cephalosporin,
    :third_generation_cephalosporin,
    :fourth_generation_cephalosporin,
    :fifth_generation_cephalosporin,
    :glycopeptide,
    :lincosamide,
    :macrolide,
    :monobactam,
    :nitrofuran,
    :penicillin,
    :polypeptide,
    :quinolone,
    :sulfonamide,
    :tetracycline,
    :antimycobacterial_drug,
    :other]


  belongs_to :questionnaire, polymorphic: true
  validates_presence_of :pos_id, strict: true

  enum aminoglycoside: [:amikacin, :gentamicin, :other], _prefix: true
  enum carbapenem: [:doripenem, :ertapenem, :imipenem, :meropenem], _prefix: true

  enum first_generation_cephalosporin: [:cefadroxil, :cefalexin, :cefazolin], _prefix: true
  enum second_generation_cephalosporin: [:cefaclor, :cefprozil, :cefuroxime], _prefix: true

  enum third_generation_cephalosporin: [:cefdinir, :cefixim, :cefotaxime, :cefpodoxime, :ceftazidime, :ceftibuten, :ceftriaxone], _prefix: true

  enum fourth_generation_cephalosporin: [:cefepime], _prefix: true

  enum fifth_generation_cephalosporin: [:ceftaroline_fosamil, :ceftobiprole], _prefix: true

  enum glycopeptide: [:teicoplanin, :telavancin, :vancomycin], _prefix: true

  enum lincosamide: [:clindamycin, :lincomycin], _prefix: true

  enum macrolide: [:azithromycin, :clarithromycin, :erythromycin, :roxithromycin, :spiramycin, :telithromycin], _prefix: true

  enum monobactam: [:aztreonam], _prefix: true

  enum nitrofuran: [:furazolidine, :nitrofurantoin], _prefix: true

#   enum penicillins: [:amoxicillin, :ampicillin, :methicillin, :nafcillin,
#                      :oxacillin, :penicillin_combinations,
#                      :penicillin_combinations_amoxicillin_clavulunate,
#                      :penicillin_combinations_ampicillin_sulbactam,
#                      :penicillin_combinations_piperacillin_tazobactam,
#                      :penicillin_combinations_ticarcillin_claculunate,
#                      :penicillin_g, :ticarcillin]

  enum penicillin: [:amoxicillin, :ampicillin, :methicillin, :nafcillin,
                     :oxacillin,
                     :amoxicillin_clavulunate,
                     :ampicillin_sulbactam,
                     :piperacillin_tazobactam,
                     :ticarcillin_claculunate,
                     :penicillin_g, :ticarcillin], _prefix: true


  enum polypeptide: [:bacitracin, :colistin, :polymyxin_b], _prefix: true

  enum quinolone: [:ciprofloxacin, :enoxacin, :gatifloxacin, :gemifloxacin,
                    :levofloxacin, :lomefloxacin, :moxifloxacin,
                    :nalidixic_acid, :norfloxacin, :ofloxacin], _prefix: true

  enum sulfonamide: [:sulfamethoxazole, :trimephtoprim_sulfamethoxazole], _prefix: true

  enum tetracycline: [:doxycycline, :tetracycline], _prefix: true

  enum antimycobacterial_drug: [:capreomycin, :clofazimine, :cycloserine,
                                 :dapsone, :ethembutol, :ethionamide,
                                 :isoniazid, :pyranizamide, :rifampicin,
                                 :streptomycin], _prefix: true

  enum other: [:chloramphenicol, :fosfomycin, :metronidazole, :trimethoprim], _prefix: true
end
