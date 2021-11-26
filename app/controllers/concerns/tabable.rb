# frozen_string_literal: true

module Tabable
  extend ActiveSupport::Concern

  included do
    attr_reader :current_tab, :current_tabs

    helper_method :current_tab, :current_tabs
  end

  class_methods do
    def tabbed(action, tabs:, default:)
      define_method "setup_tabs_for_#{action}!" do
        tab = (params[:tab] || default).to_sym

        @current_tab = if tabs.include?(tab)
                         tab
                       else
                         default
                       end

        @current_tabs = tabs
      end

      before_action "setup_tabs_for_#{action}!".to_sym, only: action
    end
  end
end
