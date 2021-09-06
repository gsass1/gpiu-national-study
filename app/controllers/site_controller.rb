require 'asciidoctor'

class SiteController < ApplicationController
  def index
    if user_signed_in?
      redirect_to dashboard_index_path
    end

    @user = User.new
    @countries = Country.all.order(name: :asc)
  end

  def contact; end
  def about; end

  def faq
    @questions = t('.all').map { |k,v| k.to_s }
  end

  def help; end
  def manual
    file = File.read(Rails.root.to_s + '/app/views/site/manual.en.adoc')
    @contents = Asciidoctor.convert file
  end
end
