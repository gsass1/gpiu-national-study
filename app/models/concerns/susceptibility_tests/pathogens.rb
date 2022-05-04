# frozen_string_literal: true

module SusceptibilityTests
  module Pathogens
    extend ActiveSupport::Concern

    SUSCEPTIBILITY_FIELDS = [
      {
        field: 'penicillins',
        sub_fields: [
          {
            field: 'penicillins_ampicillin'
          },
          {
            field: 'penicillins_ampicillin_bli'
          },
          {
            field: 'penicillins_piperacillin'
          },
          {
            field: 'penicillins_piperacillin_bli'
          },
          {
            field: 'penicillins_oxacillin'
          },
          {
            field: 'penicillins_ticarcillin'
          }
        ]
      },
      {
        field: 'cephalosporins',
        sub_fields: [
          {
            field: 'cephalosporins_cephazolin'
          },
          {
            field: 'cephalosporins_cefuroxime'
          },
          {
            field: 'cephalosporins_cefotaxime'
          },
          {
            field: 'cephalosporins_ceftazidime'
          },
          {
            field: 'cephalosporins_cefepime'
          },
          {
            field: 'cephalosporins_ceftaroline'
          },
          {
            field: 'cephalosporins_cefoxitin'
          },
          {
            field: 'cephalosporins_cefotetan'
          }
        ]
      },
      {
        field: 'carbapenem',
        sub_fields: [
          {
            field: 'carbapenem_imipenem'
          },
          {
            field: 'carbapenem_doripenem'
          },
          {
            field: 'carbapenem_ertapenem'
          }
        ]
      },
      {
        field: 'aminoglycosides',
        sub_fields: [
          {
            field: 'aminoglycosides_gentamicin'
          },
          {
            field: 'aminoglycosides_amikacin'
          },
          {
            field: 'aminoglycosides_tobramicin'
          },
          {
            field: 'aminoglycosides_netilmicin'
          }
        ]
      },
      {
        field: 'fluoroquinolones',
        sub_fields: [
          {
            field: 'fluoroquinolones_ofloxacin'
          },
          {
            field: 'fluoroquinolones_ciprofloxacin'
          },
          {
            field: 'fluoroquinolones_levofloxacin'
          },
          {
            field: 'fluoroquinolones_moxifloxacin'
          }
        ]
      },
      {
        field: 'tetracyclines',
        sub_fields: [
          {
            field: 'tetracyclines_doxycyclin'
          },
          {
            field: 'tetracyclines_tetracycline'
          },
          {
            field: 'tetracyclines_minocycline'
          },
          {
            field: 'tetracyclines_glycylcylines'
          }
        ]
      },
      {
        field: 'fosfomycin'
      },
      {
        field: 'trimethoprim'
      },
      {
        field: 'nitrofurantoin'
      },
      {
        field: 'erythromycin'
      },
      {
        field: 'clindamycin'
      },
      {
        field: 'glycopeptides',
        sub_fields: [
          {
            field: 'glycopeptides_vancomycin'
          }, {
            field: 'glycopeptides_teicoplanin'
          }, {
            field: 'glycopeptides_telavancin'
          }
        ]
      },
      {
        field: 'linezolid'
      }, {
        field: 'phenicols'
      }, {
        field: 'polymixins',
        sub_fields: [
          {
            field: 'polymixins_colistins'
          }, {
            field: 'polymixins_polymixin'
          }
        ]
      }, {
        field: 'monobactams'
      }, {
        field: 'daptomycin'
      }, {
        field: 'rifampin'
      }, {
        field: 'fucidanes'
      }
    ].freeze

    PATHOGENS = [
      'Enterobacteriaceae',
      'E. coli',
      'Klebsiella sp.',
      'Proteus sp.',
      'Enterobacter sp.',
      'Citrobacter sp.',
      'Morganella sp.',
      'Other enterobacteriaceae.',
      'Non-fermenter',
      'Pseudomonas aeruginosa',
      'Acinetoacter sp.',
      'Other non-fermenter.',
      'Gram-positive cocci',
      'Enterococcus sp.',
      'Staphylococcus aureus',
      'Coagulase-negative staphylococci (CNS)',
      'Other gram-positive cocci.',
      'Other bacteria',
      'Fungi',
      'Candida sp.',
      'Other fungi.'
    ].freeze

    OTHER_PATHOGENS = PATHOGENS.select { |p| p.start_with?('Other') }.freeze
  end
end
