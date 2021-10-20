# frozen_string_literal: true

module StudyIterationScoped
  extend ActiveSupport::Concern

  class_methods do
    def within_study_iteration(study_iteration)
      if study_iteration.nil?
        []
      else
        where(study_iteration_id: study_iteration.id)
      end
    end
  end
end
