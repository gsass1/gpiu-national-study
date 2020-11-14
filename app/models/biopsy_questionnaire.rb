class BiopsyQuestionnaire < ApplicationRecord
  include AdminResource
  include CultureResult
  include Discard::Model
  include Questionnaire
  include SaveWithErrors
  include YesNoUnknown

  NUM_CORES_OPTIONS = (1..23).to_a.map { |e| e.to_s }.reverse.unshift('>=24')

  belongs_to :patient
  before_validation :sanitize_attributes, on: :update

  validates :age, presence: true, numericality: { greater_than: 0 }

  validate_yes_no_unknown :antibiotics_preceding_months
  validate_if_yes :antibiotics_preceding_months do |group|
    group.validates :antibiotics_dosage, presence: true
    group.validates :antibiotics_duration, presence: true, numericality: true
    group.validates :antibiotics_route, inclusion: {in: %w(oral iv im), message: 'please select'}
  end

  validate_yes_no_unknown :urogenital_infection_preceding_months
  validate_yes_no_unknown :urinary_catheter
  validate_yes_no_unknown :prostate_size_measured
  validate_yes_no_unknown :diabetes_mellitus
  validate_yes_no_unknown :psa
  validates :psa_size, presence: true, numericality: { greater_than_or_equal_to: 0 }, if: Proc.new { |f| f.psa == 'yes' }

  validate_yes_no_unknown :repeated_biopsy
  validates :repeated_biopsy_number_previous_procedures, presence: true, numericality: { greater_than_or_equal_to: 0 }, if: Proc.new { |f| f.repeated_biopsy == 'yes' }

  validate_yes_no_unknown :preoperative_urine_examination
  validate_yes_no_unknown :preoperative_bowel_preparation

  validate_yes_no_unknown :antibiotic_prophylaxis
  with_options if: Proc.new { |f| f.antibiotic_prophylaxis == 'yes' } do |v|
    v.validates :antibiotic_prophylaxis_type, presence: true
    v.validates :antibiotic_prophylaxis_dosage, presence: true
    v.validates :antibiotic_prophylaxis_duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
    v.validates :antibiotic_prophylaxis_route, presence: true
  end


  validate_yes_no_unknown :biopsy_anesthesia

  validates :number_cores_taken, inclusion: { in: NUM_CORES_OPTIONS }

  enum preoperative_urine_examination_type: [:dipstick, :culture], _prefix: true

  def initial= initial
    self.patient.update_attribute :initial, initial
  end

  def initial
    self.patient.initial
  end

  private
  def sanitize_attributes
    unless self.antibiotics_preceding_months == 'yes'
      self.antibiotics_type = nil
      self.antibiotics_dosage = nil
      self.antibiotics_duration = nil
      self.antibiotics_route = nil
    end

    unless self.urinary_catheter == 'yes'
      self.urinary_catheter_duration = nil
    end

    unless self.prostate_size_measured == 'yes'
      self.prostate_size = nil
    end

    unless self.psa == 'yes'
      self.psa_size = nil
    end

    unless self.repeated_biopsy == 'yes'
      self.repeated_biopsy_number_previous_procedures = nil
    end

    unless self.preoperative_urine_examination == 'yes'
      self.preoperative_urine_examination_type = nil
    end

    unless self.preoperative_urine_examination_type == 'culture'
      self.preoperative_urine_culture_result = nil
    end

    unless self.preoperative_urine_culture_result == 'culture_positive'
      #TODO reset appendix culture result
    end

    unless self.preoperative_bowel_preparation == 'yes'
      self.preoperative_bowel_preparation_type = nil
    end

    unless self.antibiotic_prophylaxis == 'yes'
      self.antibiotic_prophylaxis_type = nil
      self.antibiotic_prophylaxis_dosage = nil
      self.antibiotic_prophylaxis_duration = nil
      self.antibiotic_prophylaxis_route = nil
    end

    unless self.biopsy_anesthesia == 'yes'
      self.biopsy_anesthesia_type = nil
    end
  end
end
