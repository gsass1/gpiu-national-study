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

  belongs_to :questionnaire, polymorphic: true, optional: true
  validates_presence_of :pos_id, strict: true

  def self.group_accessor(group)
    group_accessor_name = "#{group}_group".to_sym

    define_method group_accessor_name do
      !send(group).nil?
    end

     define_method "#{group_accessor_name}=" do |value|
       if !(value == true || value == "1" || value == "true")
         send("#{group}=", nil)
       end
     end

    validates group, presence: true, if: Proc.new { |f| f.send(group_accessor_name) == true }
  end

  enum aminoglycoside: [:amikacin, :gentamicin, :other], _prefix: true
  group_accessor :aminoglycoside

  enum carbapenem: [:doripenem, :ertapenem, :imipenem, :meropenem], _prefix: true
  group_accessor :carbapenem

  enum first_generation_cephalosporin: [:cefadroxil, :cefalexin, :cefazolin], _prefix: true
  group_accessor :first_generation_cephalosporin

  enum second_generation_cephalosporin: [:cefaclor, :cefprozil, :cefuroxime], _prefix: true
  group_accessor :second_generation_cephalosporin

  enum third_generation_cephalosporin: [:cefdinir, :cefixim, :cefotaxime, :cefpodoxime, :ceftazidime, :ceftibuten, :ceftriaxone], _prefix: true
  group_accessor :third_generation_cephalosporin

  enum fourth_generation_cephalosporin: [:cefepime], _prefix: true
  group_accessor :fourth_generation_cephalosporin

  enum fifth_generation_cephalosporin: [:ceftaroline_fosamil, :ceftobiprole], _prefix: true
  group_accessor :fifth_generation_cephalosporin

  enum glycopeptide: [:teicoplanin, :telavancin, :vancomycin], _prefix: true
  group_accessor :glycopeptide

  enum lincosamide: [:clindamycin, :lincomycin], _prefix: true
  group_accessor :lincosamide

  enum macrolide: [:azithromycin, :clarithromycin, :erythromycin, :roxithromycin, :spiramycin, :telithromycin], _prefix: true
  group_accessor :macrolide

  enum monobactam: [:aztreonam], _prefix: true
  group_accessor :monobactam

  enum nitrofuran: [:furazolidine, :nitrofurantoin], _prefix: true
  group_accessor :nitrofuran

  enum penicillin: [:amoxicillin, :ampicillin, :methicillin, :nafcillin,
                     :oxacillin,
                     :amoxicillin_clavulunate,
                     :ampicillin_sulbactam,
                     :piperacillin_tazobactam,
                     :ticarcillin_claculunate,
                     :penicillin_g, :ticarcillin], _prefix: true
  group_accessor :penicillin


  enum polypeptide: [:bacitracin, :colistin, :polymyxin_b], _prefix: true
  group_accessor :polypeptide

  enum quinolone: [:ciprofloxacin, :enoxacin, :gatifloxacin, :gemifloxacin,
                    :levofloxacin, :lomefloxacin, :moxifloxacin,
                    :nalidixic_acid, :norfloxacin, :ofloxacin], _prefix: true
  group_accessor :quinolone

  enum sulfonamide: [:sulfamethoxazole, :trimephtoprim_sulfamethoxazole], _prefix: true
  group_accessor :sulfonamide

  enum tetracycline: [:doxycycline, :tetracycline], _prefix: true
  group_accessor :tetracycline

  enum antimycobacterial_drug: [:capreomycin, :clofazimine, :cycloserine,
                                 :dapsone, :ethembutol, :ethionamide,
                                 :isoniazid, :pyranizamide, :rifampicin,
                                 :streptomycin], _prefix: true
  group_accessor :antimycobacterial_drug

  enum other: [:chloramphenicol, :fosfomycin, :metronidazole, :trimethoprim], _prefix: true
  group_accessor :other

  before_validation :sanitize_attributes, on: :update

  private
  def sanitize_attributes
    GROUPS.each do |group|
      if send("#{group}_group".to_sym) != true
        send("#{group}=", nil)
      end
    end
  end
end
