# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SiteController, type: :controller do
  it_behaves_like 'an unprotected route', :index
  it_behaves_like 'an unprotected route', :about
  it_behaves_like 'an unprotected route', :faq
  it_behaves_like 'an unprotected route', :help
  it_behaves_like 'an unprotected route', :manual
end
