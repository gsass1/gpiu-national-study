# frozen_string_literal: true

class AppendixCultureResult < ApplicationRecord
  include Discard::Model

  attr_accessor :should_valid

  belongs_to :questionnaire, polymorphic: true, optional: true
  validates :pos_id, presence: { strict: true }

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
        # {
        #   cat: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cephamycins'),
        #   group: [
        #     {
        #       field: 'susceptibility_test_cephalosporins_cefoxitin',
        #       text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cefoxitin')
        #     },
        #     {
        #       field: 'susceptibility_test_cephalosporins_cefotetan',
        #       text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cefotetan')
        #     }
        #   ]
        # }
        {
          field: 'susceptibility_test_cephalosporins_cefoxitin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cefoxitin')
        },
        {
          field: 'susceptibility_test_cephalosporins_cefotetan',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.cephalosporins_options.cefotetan')
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
        }, {
          field: 'susceptibility_test_glycopeptides_teicoplanin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.glycopeptides_options.teicoplanin')
        }, {
          field: 'susceptibility_test_glycopeptides_telavancin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.glycopeptides_options.telavancin')
        }
      ]
    },
    {
      field: 'susceptibility_test_linezolid',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.linezolid')
    }, {
      field: 'susceptibility_test_phenicols',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.phenicols')
    }, {
      field: 'susceptibility_test_polymixins',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.polymixins'),
      sub_fields: [
        {
          field: 'susceptibility_test_polymixins_colistins',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.polymixins_options.colistins')
        }, {
          field: 'susceptibility_test_polymixins_polymixin',
          text: I18n.t('shared.appendix_culture.susceptibility_fields.polymixins_options.polymixin_b')
        }
      ]
    }, {
      field: 'susceptibility_test_monobactams',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.monobactams')
    }, {
      field: 'susceptibility_test_daptomycin',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.daptomycin')
    }, {
      field: 'susceptibility_test_rifampin',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.rifampin_rifampicin')
    }, {
      field: 'susceptibility_test_fucidanes',
      text: I18n.t('shared.appendix_culture.susceptibility_fields.fucidanes')
    }
  ].freeze

  OTHER_PATHOGENS = ['Other enterobacteriaceae.',
                     'Other non-fermenter.',
                     'Other gram-positive cocci.',
                     'Other bacteria',
                     'Other fungi.'].freeze

  validates :first_pathogen, presence: { message: 'Please select.' }

  validates :first_pathogen_specify,
            presence: { message: 'Please specify.' },
            if: proc { |f| OTHER_PATHOGENS.include?(f.first_pathogen) }
  validates :first_pathogen_enter_cfu_ml, inclusion: { in: 1..5, message: 'Please select.' }

  validates :second_pathogen, presence: { message: 'Please select.' }, if: proc { |f| f.second_pathogen.present? }

  validates :second_pathogen_specify,
            presence: { message: 'Please specify.' },
            if: proc { |f| OTHER_PATHOGENS.include?(f.second_pathogen) }
  validates :second_pathogen_enter_cfu_ml,
            inclusion: { in: 1..5, message: 'Please select.' },
            if: proc { |f| f.second_pathogen.present?  }

  validates :susceptibility_standard, inclusion: { in: 1..4, message: 'Please select.' }

  # Validate susceptiblity groups
  %i[first second].each do |pos|
    SUSCEPTIBILITY_FIELDS.each do |group|
      if group.key?(:sub_fields)
        with_options if: proc { |f| f.send("#{pos}_#{group[:field]}") } do |fgroup|
          fgroup.validate "#{pos}_#{group[:field]}_count".to_sym
          group[:sub_fields].each do |sub_field|
            if sub_field[:cat].nil?
              fgroup.validates "#{pos}_#{sub_field[:field]}_s".to_sym,
                               inclusion: { in: 0..2, message: 'Please select' },
                               if: "#{pos}_#{sub_field[:field]}".to_sym
            else
              sub_field[:group].each do |sub_sub_field|
                fgroup.validates "#{pos}_#{sub_sub_field[:field]}_s".to_sym,
                                 inclusion: { in: 0..2, message: 'Please select' },
                                 if: "#{pos}_#{sub_sub_field[:field]}".to_sym
              end
            end
          end
        end
      else
        validates "#{pos}_#{group[:field]}_s".to_sym, inclusion: { in: 0..2, message: 'Please select' },
                                                      if: "#{pos}_#{group[:field]}".to_sym
      end
    end
  end

  private

  # Validate susceptiblity group counts
  SUSCEPTIBILITY_FIELDS.each do |group|
    next unless group.key?(:sub_fields)

    %w[first second].each do |pos|
      define_method "#{pos}_#{group[:field]}_count" do
        send("#{group[:field]}_count", pos)
      end

      define_method "#{group[:field]}_count" do |place|
        field_values = group[:sub_fields].map do |f|
          send("#{place}_#{f[:field]}")
        end
        condition = field_values.inject(false) { |acc, x| acc || x }
        errors.add("#{place}_#{group[:field]}".to_sym, 'Please select') unless condition
      end
    end
  end

  def sanitize_attributes
    %i[first second].each do |place|
      SUSCEPTIBILITY_FIELDS.each do |group|
        # Is this a grouped pathogen?
        if group.key?(:sub_fields)
          # Was the group selected?
          unless send("#{place}_#{group[:field]}")
            # If not, set all pathogens to nil
            group[:sub_fields].each do |sub_field|
              send("#{place}_#{sub_field[:field]}=", nil)
            end
          end

          # Set all resistance values to nil, where the pathogen is not selected
          group[:sub_fields].each do |sub_field|
            send("#{place}_#{sub_field[:field]}_s=", nil) unless send("#{place}_#{sub_field[:field]}")
          end
        else
          # Single pathogen
          send("#{place}_#{group[:field]}_s=", nil) unless send("#{place}_#{group[:field]}")
        end
      end
    end
  end
end
