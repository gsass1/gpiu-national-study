# frozen_string_literal: true

class AppendixAntibiotic < ApplicationRecord
  include Discard::Model
  include Exportable

  GROUPS = %i[
    aminoglycoside
    carbapenem
    cephalosporin
    glycopeptide
    lincosamide
    macrolide
    monobactam
    nitrofuran
    penicillin
    polypeptide
    quinolone
    trimethoprim_sulfamethoxazole
    tetracycline
    antimycobacterial_drug
    other
  ].freeze

  CEPHALOSPORIN_GENERATIONS = [
    # 1st generation
    %i[cefadroxil cefalexin cefazolin],

    # 2nd generation
    %i[cefaclor cefprozil cefuroxime],

    # 3rd generation
    %i[cefdinir cefixim cefotaxime cefpodoxime ceftazidime ceftibuten ceftriaxone],

    # 4th generation
    %i[cefepime],

    # 5th generation
    %i[ceftaroline_fosamil ceftobiprole]
  ].freeze

  belongs_to :questionnaire, polymorphic: true, optional: true
  validates :pos_id, presence: { strict: true }

  def self.group_accessor(group)
    group_accessor_name = "#{group}_group".to_sym

    define_method group_accessor_name do
      !send(group).nil?
    end

    define_method "#{group_accessor_name}=" do |value|
      send("#{group}=", nil) unless [true, '1', 'true'].include?(value)
    end

    validates group, presence: true, if: proc { |f| f.send(group_accessor_name) == true }
  end

  enum aminoglycoside: { amikacin: 0, gentamicin: 1, other: 2 }, _prefix: true
  group_accessor :aminoglycoside

  enum carbapenem: { doripenem: 0, ertapenem: 1, imipenem: 2, meropenem: 3 }, _prefix: true
  group_accessor :carbapenem

  enum cephalosporin: {
    cefaclor: 0,
    cefadroxil: 1,
    cefalexin: 2,
    cefazolin: 3,
    cefdinir: 4,
    cefepime: 5,
    cefixim: 6,
    cefotaxime: 7,
    cefpodoxime: 8,
    cefprozil: 9,
    ceftaroline_fosamil: 10,
    ceftazidime: 11,
    ceftibuten: 12,
    ceftobiprole: 13,
    ceftriaxone: 14,
    cefuroxime: 15
  }, _prefix: true
  group_accessor :cephalosporin

  #   enum first_generation_cephalosporin: { cefadroxil: 0, cefalexin: 1, cefazolin: 2 }, _prefix: true
  #   group_accessor :first_generation_cephalosporin

  #   enum second_generation_cephalosporin: { cefaclor: 0, cefprozil: 1, cefuroxime: 2 }, _prefix: true
  #   group_accessor :second_generation_cephalosporin

  #   enum third_generation_cephalosporin: {
  #     cefdinir: 0,
  #     cefixim: 1,
  #     cefotaxime: 2,
  #     cefpodoxime: 3,
  #     ceftazidime: 4,
  #     ceftibuten: 5,
  #     ceftriaxone: 6
  #   }, _prefix: true
  #   group_accessor :third_generation_cephalosporin

  #   enum fourth_generation_cephalosporin: { cefepime: 0 }, _prefix: true
  #   group_accessor :fourth_generation_cephalosporin

  #   enum fifth_generation_cephalosporin: { ceftaroline_fosamil: 0, ceftobiprole: 1 }, _prefix: true
  #   group_accessor :fifth_generation_cephalosporin

  enum glycopeptide: { teicoplanin: 0, telavancin: 1, vancomycin: 2 }, _prefix: true
  group_accessor :glycopeptide

  enum lincosamide: { clindamycin: 0, lincomycin: 1 }, _prefix: true
  group_accessor :lincosamide

  enum macrolide: {
    azithromycin: 0,
    clarithromycin: 1,
    erythromycin: 2,
    roxithromycin: 3,
    spiramycin: 4,
    telithromycin: 5
  }, _prefix: true
  group_accessor :macrolide

  enum monobactam: { aztreonam: 0 }, _prefix: true
  group_accessor :monobactam

  enum nitrofuran: { furazolidine: 0, nitrofurantoin: 1 }, _prefix: true
  group_accessor :nitrofuran

  enum penicillin: {
    amoxicillin: 0,
    ampicillin: 1,
    methicillin: 2,
    nafcillin: 3,
    oxacillin: 4,
    amoxicillin_clavulunate: 5,
    ampicillin_sulbactam: 6,
    piperacillin_tazobactam: 7,
    ticarcillin_claculunate: 8,
    penicillin_g: 9,
    ticarcillin: 10
  }, _prefix: true
  group_accessor :penicillin

  enum polypeptide: { bacitracin: 0, colistin: 1, polymyxin_b: 2 }, _prefix: true
  group_accessor :polypeptide

  enum quinolone: {
    ciprofloxacin: 0,
    enoxacin: 1,
    gatifloxacin: 2,
    gemifloxacin: 3,
    levofloxacin: 4,
    lomefloxacin: 5,
    moxifloxacin: 6,
    nalidixic_acid: 7,
    norfloxacin: 8,
    ofloxacin: 9
  }, _prefix: true
  group_accessor :quinolone

  enum trimethoprim_sulfamethoxazole: { trimethoprim_sulfamethoxazole: 0 }, _prefix: true
  group_accessor :trimethoprim_sulfamethoxazole

  enum tetracycline: { doxycycline: 0, tetracycline: 1 }, _prefix: true
  group_accessor :tetracycline

  enum antimycobacterial_drug: {
    capreomycin: 0,
    clofazimine: 1,
    cycloserine: 2,
    dapsone: 3,
    ethembutol: 4,
    ethionamide: 5,
    isoniazid: 6,
    pyranizamide: 7,
    rifampicin: 8,
    streptomycin: 9
  }, _prefix: true
  group_accessor :antimycobacterial_drug

  enum other: { chloramphenicol: 0, fosfomycin: 1, metronidazole: 2, trimethoprim: 3 }, _prefix: true
  group_accessor :other

  before_validation :sanitize_attributes, on: :update

  exports_as do |e, p|
    GROUPS.each_with_index do |group, index|
      e.value (index + 1).to_s, p.send(group)
    end
  end

  private

  def sanitize_attributes
    GROUPS.each do |group|
      send("#{group}=", nil) if send("#{group}_group".to_sym) != true
    end
  end
end
