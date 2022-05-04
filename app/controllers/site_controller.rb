# frozen_string_literal: true

require 'asciidoctor'

class SiteController < ApplicationController
  layout 'landing_page', only: :index

  def index
    redirect_to dashboard_index_path if user_signed_in?

    @user = User.new
    @countries = Country.all.order(name: :asc)

    @upcoming_studies = StudyIteration.accepted.select { |si| si.active? || !si.passed? }.first(5)
  end

  def contact; end

  def about; end

  def faq
    @questions = t('.all').map { |k, _v| k.to_s }
  end

  def help; end

  def manual
    file = File.read("#{Rails.root}/app/views/site/manual.en.adoc")
    @contents = Asciidoctor.convert file
  end
end
