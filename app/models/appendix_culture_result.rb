class AppendixCultureResult < ApplicationRecord
  include Discard::Model

  attr_accessor :should_valid

  belongs_to :questionnaire, polymorphic: true
  validates_presence_of :pos_id, strict: true

  before_validation :sanitize_attributes

  SUSCEPTIBILITY_FIELDS = [
    {
      field: 'susceptibility_test_penicillins',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.penicillins'),
      sub_fields: [
        {
          field: 'susceptibility_test_penicillins_ampicillin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.penicillins_options.ampicillin_amoxicillin')
        },
        {
          field: 'susceptibility_test_penicillins_ampicillin_bli',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.penicillins_options.ampicillin_amoxicillin_bli')
        },
        {
          field: 'susceptibility_test_penicillins_piperacillin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.penicillins_options.piperacillin')
        },
        {
          field: 'susceptibility_test_penicillins_piperacillin_bli',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.penicillins_options.piperacillin_bli')
        },
        {
          field: 'susceptibility_test_penicillins_oxacillin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.penicillins_options.oxacillin')
        },
        {
          field: 'susceptibility_test_penicillins_ticarcillin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.penicillins_options.ticarcillin_clavulanic_acid')
        }
      ]
    },
    {
      field: 'susceptibility_test_cephalosporins',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins'),
      sub_fields: [
        {
          field: 'susceptibility_test_cephalosporins_cephazolin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cephazolin')
        },
        {
          field: 'susceptibility_test_cephalosporins_cefuroxime',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cefuroxime')
        },
        {
          field: 'susceptibility_test_cephalosporins_cefotaxime',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cefotaxime_ceftriaxone')
        },
        {
          field: 'susceptibility_test_cephalosporins_ceftazidime',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.ceftazidime')
        },
        {
          field: 'susceptibility_test_cephalosporins_cefepime',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cefepime')
        },
        {
          field: 'susceptibility_test_cephalosporins_ceftaroline',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.ceftaroline')
        },
        {
          cat: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cephamycins'),
          group: [
            {
              field: 'susceptibility_test_cephalosporins_cefoxitin',
              text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cefoxitin')
            },
            {
              field: 'susceptibility_test_cephalosporins_cefotetan',
              text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cefotetan')
            }
          ]
        }
      ]
    },
    {
      field: 'susceptibility_test_carbapenem',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.carbapenem'),
      sub_fields: [
        {
          field: 'susceptibility_test_carbapenem_imipenem',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.carbapenem_options.imipenem_meronem')
        },
        {
          field: 'susceptibility_test_carbapenem_doripenem',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.carbapenem_options.doripenem')
        },
        {
          field: 'susceptibility_test_carbapenem_ertapenem',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.carbapenem_options.ertapenem')
        }
      ]
    },
    {
      field: 'susceptibility_test_aminoglycosides',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.aminoglycosides'),
      sub_fields: [
        {
          field: 'susceptibility_test_aminoglycosides_gentamicin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.aminoglycosides_options.gentamicin')
        },
        {
          field: 'susceptibility_test_aminoglycosides_amikacin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.aminoglycosides_options.amikacin')
        },
        {
          field: 'susceptibility_test_aminoglycosides_tobramicin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.aminoglycosides_options.tobramicin')
        },
        {
          field: 'susceptibility_test_aminoglycosides_netilmicin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.aminoglycosides_options.netilmicin')
        }
      ]
    },
    {
      field: 'susceptibility_test_fluoroquinolones',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.fluoroquinolones'),
      sub_fields: [
        {
          field: 'susceptibility_test_fluoroquinolones_ofloxacin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.fluoroquinolones_options.ofloxacin')
        },
        {
          field: 'susceptibility_test_fluoroquinolones_ciprofloxacin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.fluoroquinolones_options.ciprofloxacin')
        },
        {
          field: 'susceptibility_test_fluoroquinolones_levofloxacin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.fluoroquinolones_options.levofloxacin')
        },
        {
          field: 'susceptibility_test_fluoroquinolones_moxifloxacin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.fluoroquinolones_options.moxifloxacin')
        }
      ]
    },
    {
      field: 'susceptibility_test_tetracyclines',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.tetracyclines'),
      sub_fields: [
        {
          field: 'susceptibility_test_tetracyclines_doxycyclin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.tetracyclines_options.doxycyclin')
        },
        {
          field: 'susceptibility_test_tetracyclines_tetracycline',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.tetracyclines_options.tetracycline')
        },
        {
          field: 'susceptibility_test_tetracyclines_minocycline',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.tetracyclines_options.minocycline')
        },
        {
          field: 'susceptibility_test_tetracyclines_glycylcylines',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.tetracyclines_options.glycylcylines_tigecyline')
        }
      ]
    },
    {
      field: 'susceptibility_test_fosfomycin',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.fosfomycin_trometamol')
    },
    {
      field: 'susceptibility_test_trimethoprim',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.trimethoprim_solfonamide_cotrimoxazole')
    },
    {
      field: 'susceptibility_test_nitrofurantoin',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.nitrofurantoin')
    },
    {
      field: 'susceptibility_test_erythromycin',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.erythromycin_macrolides')
    },
    {
      field: 'susceptibility_test_clindamycin',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.clindamycin')
    },
    {
      field: 'susceptibility_test_glycopeptides',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.glycopeptides'),
      sub_fields: [
        {
          field: 'susceptibility_test_glycopeptides_vancomycin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.glycopeptides_options.vancomycin')
        },{
          field: 'susceptibility_test_glycopeptides_teicoplanin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.glycopeptides_options.teicoplanin')
        },{
          field: 'susceptibility_test_glycopeptides_telavancin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.glycopeptides_options.telavancin')
        }
      ]
    },
    {
      field: 'susceptibility_test_linezolid',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.linezolid')
    },{
      field: 'susceptibility_test_phenicols',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.phenicols')
    },{
      field: 'susceptibility_test_polymixins',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.polymixins'),
      sub_fields: [
        {
          field: 'susceptibility_test_polymixins_colistins',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.polymixins_options.colistins')
        },{
          field: 'susceptibility_test_polymixins_polymixin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.polymixins_options.polymixin_b')
        }
      ]
    },{
      field: 'susceptibility_test_monobactams',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.monobactams')
    },{
      field: 'susceptibility_test_daptomycin',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.daptomycin')
    },{
      field: 'susceptibility_test_rifampin',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.rifampin_rifampicin')
    },{
      field: 'susceptibility_test_fucidanes',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.fucidanes')
    }
  ]

  with_options if: Proc.new{|f| f.should_valid} do |v|
    v.validates :cdc_criteria, inclusion: {in: 0..4, message: 'Please select.'}

    v.validates :first_pathogen, presence: {message: 'Please select.'}

    v.validates :first_pathogen_specify, presence: {message: 'Please specify.'}, if: Proc.new{|f| f.first_pathogen == 'Other enterobacteriaceae.' || f.first_pathogen == 'Other non-fermenter.' || f.first_pathogen == 'Other gram-positive cocci.' || f.first_pathogen == 'Other bacteria' || f.first_pathogen == 'Other fungi.'}
    v.validates :first_pathogen_enter_cfu_ml, inclusion: {in: 1..5, message: 'Please select.'}

    v.validates :second_pathogen, presence: {message: 'Please select.'}, if: Proc.new{|f| f.second_pathogen.present?}
    v.validates :second_pathogen_specify, presence: {message: 'Please specify.'}, if: Proc.new{|f| f.second_pathogen == 'Other enterobacteriaceae.' || f.second_pathogen == 'Other non-fermenter.' || f.second_pathogen == 'Other gram-positive cocci.' || f.second_pathogen == 'Other bacteria' || f.second_pathogen == 'Other fungi.' }
    v.validates :second_pathogen_enter_cfu_ml, inclusion: {in: 1..5, message: 'Please select.'}, if: Proc.new{|f| f.second_pathogen.present?}

    v.validates :susceptibility_standard, inclusion: {in: 1..4, message: 'Please select.'}
  end

  # Validate susceptiblity groups
  [:first, :second].each do |pos|
    SUSCEPTIBILITY_FIELDS.each do |group|
      unless group.has_key?(:sub_fields)
        validates "#{pos}_#{group[:field]}_s".to_sym, inclusion: {in: 0..2, message: 'Please select'}, if: "#{pos}_#{group[:field]}".to_sym
      else
        with_options if: Proc.new { |f| f.send("#{pos}_#{group[:field]}") } do |fgroup|
          fgroup.validate "#{pos}_#{group[:field]}_count".to_sym
          group[:sub_fields].each do |sub_field|
            unless sub_field[:cat].nil?
              sub_field[:group].each do |sub_sub_field|
                fgroup.validates "#{pos}_#{sub_sub_field[:field]}_s".to_sym, inclusion: {in: 0..2, message: 'Please select'}, if: "#{pos}_#{sub_sub_field[:field]}".to_sym
              end
            else
              fgroup.validates "#{pos}_#{sub_field[:field]}_s".to_sym, inclusion: {in: 0..2, message: 'Please select'}, if: "#{pos}_#{sub_field[:field]}".to_sym
            end
          end
        end
      end
    end
  end

  private
  # Validate susceptiblity group counts
  SUSCEPTIBILITY_FIELDS.each do |group|
    next unless group.has_key?(:sub_fields)

    ['first', 'second'].each do |pos|
      define_method "#{pos}_#{group[:field]}_count" do
        self.send("#{group[:field]}_count", "\"#{pos}\"")
      end

      define_method "#{group[:field]}_count" do |place|
        condition = group[:sub_fields].map { |f| self.send("#{pos}_#{f[:field]}") }.inject(false) { |acc, x| acc || x }
        unless condition
          errors.add("#{place}_#{group[:field]}".to_sym, 'Please select')
        end
      end
    end
  end

  def sanitize_attributes
    # NOTE(gian): I don't even wanna attempt to DRY this
    #
    # This Script generate the following code block
    # ['first', 'second'].each do |place|
    #   SUSCEPTIBILITY_FIELDS.each do |group|
    #     unless group.has_key?(:sub_fields)
    #       puts "self.#{place}_#{group[:field]}_s = nil unless self.#{place}_#{group[:field]}"
    #     else
    #       puts  "\nunless self.#{place}_#{group[:field]}"
    #       group[:sub_fields].each do |sub_field|
    #         next unless sub_field.has_key? :field

    #         puts  "  self.#{place}_#{sub_field[:field]} = nil"
    #       end
    #       puts  "end\n\n"
    #       group[:sub_fields].each do |sub_field|
    #         next if sub_field[:field].nil?
    #         puts  "self.#{place}_#{sub_field[:field]}_s = nil unless self.#{place}_#{sub_field[:field]}"
    #       end

    #       group[:sub_fields].each do |sub_field|
    #         next unless sub_field.has_key?(:group)

    #         puts  "\nunless self.#{place}_#{group[:field]}"
    #         sub_field[:group].each do |sub_sub_field|
    #           puts  "  self.#{place}_#{sub_sub_field[:field]} = nil"
    #         end
    #         puts  "end\n"
    #         sub_field[:group].each do |sub_sub_field|
    #           puts "self.#{place}_#{sub_sub_field[:field]}_s = nil unless self.#{place}_#{sub_sub_field[:field]}"
    #         end
    #       end
    #     end
    #   end
    # end

    unless self.first_susceptibility_test_penicillins
      self.first_susceptibility_test_penicillins_ampicillin = nil
      self.first_susceptibility_test_penicillins_ampicillin_bli = nil
      self.first_susceptibility_test_penicillins_piperacillin = nil
      self.first_susceptibility_test_penicillins_piperacillin_bli = nil
      self.first_susceptibility_test_penicillins_oxacillin = nil
      self.first_susceptibility_test_penicillins_ticarcillin = nil
    end

    self.first_susceptibility_test_penicillins_ampicillin_s = nil unless self.first_susceptibility_test_penicillins_ampicillin
    self.first_susceptibility_test_penicillins_ampicillin_bli_s = nil unless self.first_susceptibility_test_penicillins_ampicillin_bli
    self.first_susceptibility_test_penicillins_piperacillin_s = nil unless self.first_susceptibility_test_penicillins_piperacillin
    self.first_susceptibility_test_penicillins_piperacillin_bli_s = nil unless self.first_susceptibility_test_penicillins_piperacillin_bli
    self.first_susceptibility_test_penicillins_oxacillin_s = nil unless self.first_susceptibility_test_penicillins_oxacillin
    self.first_susceptibility_test_penicillins_ticarcillin_s = nil unless self.first_susceptibility_test_penicillins_ticarcillin

    unless self.first_susceptibility_test_cephalosporins
      self.first_susceptibility_test_cephalosporins_cephazolin = nil
      self.first_susceptibility_test_cephalosporins_cefuroxime = nil
      self.first_susceptibility_test_cephalosporins_cefotaxime = nil
      self.first_susceptibility_test_cephalosporins_ceftazidime = nil
      self.first_susceptibility_test_cephalosporins_cefepime = nil
      self.first_susceptibility_test_cephalosporins_ceftaroline = nil
    end

    self.first_susceptibility_test_cephalosporins_cephazolin_s = nil unless self.first_susceptibility_test_cephalosporins_cephazolin
    self.first_susceptibility_test_cephalosporins_cefuroxime_s = nil unless self.first_susceptibility_test_cephalosporins_cefuroxime
    self.first_susceptibility_test_cephalosporins_cefotaxime_s = nil unless self.first_susceptibility_test_cephalosporins_cefotaxime
    self.first_susceptibility_test_cephalosporins_ceftazidime_s = nil unless self.first_susceptibility_test_cephalosporins_ceftazidime
    self.first_susceptibility_test_cephalosporins_cefepime_s = nil unless self.first_susceptibility_test_cephalosporins_cefepime
    self.first_susceptibility_test_cephalosporins_ceftaroline_s = nil unless self.first_susceptibility_test_cephalosporins_ceftaroline

    unless self.first_susceptibility_test_cephalosporins
      self.first_susceptibility_test_cephalosporins_cefoxitin = nil
      self.first_susceptibility_test_cephalosporins_cefotetan = nil
    end
    self.first_susceptibility_test_cephalosporins_cefoxitin_s = nil unless self.first_susceptibility_test_cephalosporins_cefoxitin
    self.first_susceptibility_test_cephalosporins_cefotetan_s = nil unless self.first_susceptibility_test_cephalosporins_cefotetan

    unless self.first_susceptibility_test_carbapenem
      self.first_susceptibility_test_carbapenem_imipenem = nil
      self.first_susceptibility_test_carbapenem_doripenem = nil
      self.first_susceptibility_test_carbapenem_ertapenem = nil
    end

    self.first_susceptibility_test_carbapenem_imipenem_s = nil unless self.first_susceptibility_test_carbapenem_imipenem
    self.first_susceptibility_test_carbapenem_doripenem_s = nil unless self.first_susceptibility_test_carbapenem_doripenem
    self.first_susceptibility_test_carbapenem_ertapenem_s = nil unless self.first_susceptibility_test_carbapenem_ertapenem

    unless self.first_susceptibility_test_aminoglycosides
      self.first_susceptibility_test_aminoglycosides_gentamicin = nil
      self.first_susceptibility_test_aminoglycosides_amikacin = nil
      self.first_susceptibility_test_aminoglycosides_tobramicin = nil
      self.first_susceptibility_test_aminoglycosides_netilmicin = nil
    end

    self.first_susceptibility_test_aminoglycosides_gentamicin_s = nil unless self.first_susceptibility_test_aminoglycosides_gentamicin
    self.first_susceptibility_test_aminoglycosides_amikacin_s = nil unless self.first_susceptibility_test_aminoglycosides_amikacin
    self.first_susceptibility_test_aminoglycosides_tobramicin_s = nil unless self.first_susceptibility_test_aminoglycosides_tobramicin
    self.first_susceptibility_test_aminoglycosides_netilmicin_s = nil unless self.first_susceptibility_test_aminoglycosides_netilmicin

    unless self.first_susceptibility_test_fluoroquinolones
      self.first_susceptibility_test_fluoroquinolones_ofloxacin = nil
      self.first_susceptibility_test_fluoroquinolones_ciprofloxacin = nil
      self.first_susceptibility_test_fluoroquinolones_levofloxacin = nil
      self.first_susceptibility_test_fluoroquinolones_moxifloxacin = nil
    end

    self.first_susceptibility_test_fluoroquinolones_ofloxacin_s = nil unless self.first_susceptibility_test_fluoroquinolones_ofloxacin
    self.first_susceptibility_test_fluoroquinolones_ciprofloxacin_s = nil unless self.first_susceptibility_test_fluoroquinolones_ciprofloxacin
    self.first_susceptibility_test_fluoroquinolones_levofloxacin_s = nil unless self.first_susceptibility_test_fluoroquinolones_levofloxacin
    self.first_susceptibility_test_fluoroquinolones_moxifloxacin_s = nil unless self.first_susceptibility_test_fluoroquinolones_moxifloxacin

    unless self.first_susceptibility_test_tetracyclines
      self.first_susceptibility_test_tetracyclines_doxycyclin = nil
      self.first_susceptibility_test_tetracyclines_tetracycline = nil
      self.first_susceptibility_test_tetracyclines_minocycline = nil
      self.first_susceptibility_test_tetracyclines_glycylcylines = nil
    end

    self.first_susceptibility_test_tetracyclines_doxycyclin_s = nil unless self.first_susceptibility_test_tetracyclines_doxycyclin
    self.first_susceptibility_test_tetracyclines_tetracycline_s = nil unless self.first_susceptibility_test_tetracyclines_tetracycline
    self.first_susceptibility_test_tetracyclines_minocycline_s = nil unless self.first_susceptibility_test_tetracyclines_minocycline
    self.first_susceptibility_test_tetracyclines_glycylcylines_s = nil unless self.first_susceptibility_test_tetracyclines_glycylcylines
    self.first_susceptibility_test_fosfomycin_s = nil unless self.first_susceptibility_test_fosfomycin
    self.first_susceptibility_test_trimethoprim_s = nil unless self.first_susceptibility_test_trimethoprim
    self.first_susceptibility_test_nitrofurantoin_s = nil unless self.first_susceptibility_test_nitrofurantoin
    self.first_susceptibility_test_erythromycin_s = nil unless self.first_susceptibility_test_erythromycin
    self.first_susceptibility_test_clindamycin_s = nil unless self.first_susceptibility_test_clindamycin

    unless self.first_susceptibility_test_glycopeptides
      self.first_susceptibility_test_glycopeptides_vancomycin = nil
      self.first_susceptibility_test_glycopeptides_teicoplanin = nil
      self.first_susceptibility_test_glycopeptides_telavancin = nil
    end

    self.first_susceptibility_test_glycopeptides_vancomycin_s = nil unless self.first_susceptibility_test_glycopeptides_vancomycin
    self.first_susceptibility_test_glycopeptides_teicoplanin_s = nil unless self.first_susceptibility_test_glycopeptides_teicoplanin
    self.first_susceptibility_test_glycopeptides_telavancin_s = nil unless self.first_susceptibility_test_glycopeptides_telavancin
    self.first_susceptibility_test_linezolid_s = nil unless self.first_susceptibility_test_linezolid
    self.first_susceptibility_test_phenicols_s = nil unless self.first_susceptibility_test_phenicols

    unless self.first_susceptibility_test_polymixins
      self.first_susceptibility_test_polymixins_colistins = nil
      self.first_susceptibility_test_polymixins_polymixin = nil
    end

    self.first_susceptibility_test_polymixins_colistins_s = nil unless self.first_susceptibility_test_polymixins_colistins
    self.first_susceptibility_test_polymixins_polymixin_s = nil unless self.first_susceptibility_test_polymixins_polymixin
    self.first_susceptibility_test_monobactams_s = nil unless self.first_susceptibility_test_monobactams
    self.first_susceptibility_test_daptomycin_s = nil unless self.first_susceptibility_test_daptomycin
    self.first_susceptibility_test_rifampin_s = nil unless self.first_susceptibility_test_rifampin
    self.first_susceptibility_test_fucidanes_s = nil unless self.first_susceptibility_test_fucidanes

    unless self.second_susceptibility_test_penicillins
      self.second_susceptibility_test_penicillins_ampicillin = nil
      self.second_susceptibility_test_penicillins_ampicillin_bli = nil
      self.second_susceptibility_test_penicillins_piperacillin = nil
      self.second_susceptibility_test_penicillins_piperacillin_bli = nil
      self.second_susceptibility_test_penicillins_oxacillin = nil
      self.second_susceptibility_test_penicillins_ticarcillin = nil
    end

    self.second_susceptibility_test_penicillins_ampicillin_s = nil unless self.second_susceptibility_test_penicillins_ampicillin
    self.second_susceptibility_test_penicillins_ampicillin_bli_s = nil unless self.second_susceptibility_test_penicillins_ampicillin_bli
    self.second_susceptibility_test_penicillins_piperacillin_s = nil unless self.second_susceptibility_test_penicillins_piperacillin
    self.second_susceptibility_test_penicillins_piperacillin_bli_s = nil unless self.second_susceptibility_test_penicillins_piperacillin_bli
    self.second_susceptibility_test_penicillins_oxacillin_s = nil unless self.second_susceptibility_test_penicillins_oxacillin
    self.second_susceptibility_test_penicillins_ticarcillin_s = nil unless self.second_susceptibility_test_penicillins_ticarcillin

    unless self.second_susceptibility_test_cephalosporins
      self.second_susceptibility_test_cephalosporins_cephazolin = nil
      self.second_susceptibility_test_cephalosporins_cefuroxime = nil
      self.second_susceptibility_test_cephalosporins_cefotaxime = nil
      self.second_susceptibility_test_cephalosporins_ceftazidime = nil
      self.second_susceptibility_test_cephalosporins_cefepime = nil
      self.second_susceptibility_test_cephalosporins_ceftaroline = nil
    end

    self.second_susceptibility_test_cephalosporins_cephazolin_s = nil unless self.second_susceptibility_test_cephalosporins_cephazolin
    self.second_susceptibility_test_cephalosporins_cefuroxime_s = nil unless self.second_susceptibility_test_cephalosporins_cefuroxime
    self.second_susceptibility_test_cephalosporins_cefotaxime_s = nil unless self.second_susceptibility_test_cephalosporins_cefotaxime
    self.second_susceptibility_test_cephalosporins_ceftazidime_s = nil unless self.second_susceptibility_test_cephalosporins_ceftazidime
    self.second_susceptibility_test_cephalosporins_cefepime_s = nil unless self.second_susceptibility_test_cephalosporins_cefepime
    self.second_susceptibility_test_cephalosporins_ceftaroline_s = nil unless self.second_susceptibility_test_cephalosporins_ceftaroline

    unless self.second_susceptibility_test_cephalosporins
      self.second_susceptibility_test_cephalosporins_cefoxitin = nil
      self.second_susceptibility_test_cephalosporins_cefotetan = nil
    end
    self.second_susceptibility_test_cephalosporins_cefoxitin_s = nil unless self.second_susceptibility_test_cephalosporins_cefoxitin
    self.second_susceptibility_test_cephalosporins_cefotetan_s = nil unless self.second_susceptibility_test_cephalosporins_cefotetan

    unless self.second_susceptibility_test_carbapenem
      self.second_susceptibility_test_carbapenem_imipenem = nil
      self.second_susceptibility_test_carbapenem_doripenem = nil
      self.second_susceptibility_test_carbapenem_ertapenem = nil
    end

    self.second_susceptibility_test_carbapenem_imipenem_s = nil unless self.second_susceptibility_test_carbapenem_imipenem
    self.second_susceptibility_test_carbapenem_doripenem_s = nil unless self.second_susceptibility_test_carbapenem_doripenem
    self.second_susceptibility_test_carbapenem_ertapenem_s = nil unless self.second_susceptibility_test_carbapenem_ertapenem

    unless self.second_susceptibility_test_aminoglycosides
      self.second_susceptibility_test_aminoglycosides_gentamicin = nil
      self.second_susceptibility_test_aminoglycosides_amikacin = nil
      self.second_susceptibility_test_aminoglycosides_tobramicin = nil
      self.second_susceptibility_test_aminoglycosides_netilmicin = nil
    end

    self.second_susceptibility_test_aminoglycosides_gentamicin_s = nil unless self.second_susceptibility_test_aminoglycosides_gentamicin
    self.second_susceptibility_test_aminoglycosides_amikacin_s = nil unless self.second_susceptibility_test_aminoglycosides_amikacin
    self.second_susceptibility_test_aminoglycosides_tobramicin_s = nil unless self.second_susceptibility_test_aminoglycosides_tobramicin
    self.second_susceptibility_test_aminoglycosides_netilmicin_s = nil unless self.second_susceptibility_test_aminoglycosides_netilmicin

    unless self.second_susceptibility_test_fluoroquinolones
      self.second_susceptibility_test_fluoroquinolones_ofloxacin = nil
      self.second_susceptibility_test_fluoroquinolones_ciprofloxacin = nil
      self.second_susceptibility_test_fluoroquinolones_levofloxacin = nil
      self.second_susceptibility_test_fluoroquinolones_moxifloxacin = nil
    end

    self.second_susceptibility_test_fluoroquinolones_ofloxacin_s = nil unless self.second_susceptibility_test_fluoroquinolones_ofloxacin
    self.second_susceptibility_test_fluoroquinolones_ciprofloxacin_s = nil unless self.second_susceptibility_test_fluoroquinolones_ciprofloxacin
    self.second_susceptibility_test_fluoroquinolones_levofloxacin_s = nil unless self.second_susceptibility_test_fluoroquinolones_levofloxacin
    self.second_susceptibility_test_fluoroquinolones_moxifloxacin_s = nil unless self.second_susceptibility_test_fluoroquinolones_moxifloxacin

    unless self.second_susceptibility_test_tetracyclines
      self.second_susceptibility_test_tetracyclines_doxycyclin = nil
      self.second_susceptibility_test_tetracyclines_tetracycline = nil
      self.second_susceptibility_test_tetracyclines_minocycline = nil
      self.second_susceptibility_test_tetracyclines_glycylcylines = nil
    end

    self.second_susceptibility_test_tetracyclines_doxycyclin_s = nil unless self.second_susceptibility_test_tetracyclines_doxycyclin
    self.second_susceptibility_test_tetracyclines_tetracycline_s = nil unless self.second_susceptibility_test_tetracyclines_tetracycline
    self.second_susceptibility_test_tetracyclines_minocycline_s = nil unless self.second_susceptibility_test_tetracyclines_minocycline
    self.second_susceptibility_test_tetracyclines_glycylcylines_s = nil unless self.second_susceptibility_test_tetracyclines_glycylcylines
    self.second_susceptibility_test_fosfomycin_s = nil unless self.second_susceptibility_test_fosfomycin
    self.second_susceptibility_test_trimethoprim_s = nil unless self.second_susceptibility_test_trimethoprim
    self.second_susceptibility_test_nitrofurantoin_s = nil unless self.second_susceptibility_test_nitrofurantoin
    self.second_susceptibility_test_erythromycin_s = nil unless self.second_susceptibility_test_erythromycin
    self.second_susceptibility_test_clindamycin_s = nil unless self.second_susceptibility_test_clindamycin

    unless self.second_susceptibility_test_glycopeptides
      self.second_susceptibility_test_glycopeptides_vancomycin = nil
      self.second_susceptibility_test_glycopeptides_teicoplanin = nil
      self.second_susceptibility_test_glycopeptides_telavancin = nil
    end

    self.second_susceptibility_test_glycopeptides_vancomycin_s = nil unless self.second_susceptibility_test_glycopeptides_vancomycin
    self.second_susceptibility_test_glycopeptides_teicoplanin_s = nil unless self.second_susceptibility_test_glycopeptides_teicoplanin
    self.second_susceptibility_test_glycopeptides_telavancin_s = nil unless self.second_susceptibility_test_glycopeptides_telavancin
    self.second_susceptibility_test_linezolid_s = nil unless self.second_susceptibility_test_linezolid
    self.second_susceptibility_test_phenicols_s = nil unless self.second_susceptibility_test_phenicols

    unless self.second_susceptibility_test_polymixins
      self.second_susceptibility_test_polymixins_colistins = nil
      self.second_susceptibility_test_polymixins_polymixin = nil
    end

    self.second_susceptibility_test_polymixins_colistins_s = nil unless self.second_susceptibility_test_polymixins_colistins
    self.second_susceptibility_test_polymixins_polymixin_s = nil unless self.second_susceptibility_test_polymixins_polymixin
    self.second_susceptibility_test_monobactams_s = nil unless self.second_susceptibility_test_monobactams
    self.second_susceptibility_test_daptomycin_s = nil unless self.second_susceptibility_test_daptomycin
    self.second_susceptibility_test_rifampin_s = nil unless self.second_susceptibility_test_rifampin
    self.second_susceptibility_test_fucidanes_s = nil unless self.second_susceptibility_test_fucidanes
  end
end
