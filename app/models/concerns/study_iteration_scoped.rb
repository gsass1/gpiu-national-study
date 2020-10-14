module StudyIterationScoped
  extend ActiveSupport::Concern

  class_methods do
    def within_study_iteration(study_iteration)
      unless study_iteration.nil?
        self.where(study_iteration_id: study_iteration.id)
      else
        []
      end
    end
  end
end
