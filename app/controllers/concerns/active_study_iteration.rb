module ActiveStudyIteration
  extend ActiveSupport::Concern

  included do
    before_action :current_study_iteration
  end

  class_methods do
    def requires_active_study_iteration(actions)
      before_action :check_current_study_iteration!, only: actions
    end
  end

  def current_study_iteration
    @current_study_iteration ||= (current_user.nil? ? nil : current_user.country.next_or_current_study_iteration)
  end

  def check_current_study_iteration!
    unless study_active?
      flash[:warning] = 'The study is not currently active.'
      redirect_back fallback_location: (current_user.nil? ? root_path : dashboard_index_path)
    end
  end

  def study_active?
    !current_study_iteration.nil? && current_study_iteration.active?
  end
end
