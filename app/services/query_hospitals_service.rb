# frozen_string_literal: true

class QueryHospitalsService < BaseService
  def initialize(user, query)
    @user = user
    @query = query
  end

  def call
    hospitals = @user.country.hospitals.visible

    if @query.present?
      if postgres?
        hospitals = hospitals.where('similarity(name, ?) > 0.1',
                                    @query).order("similarity(name, #{ActiveRecord::Base.connection.quote(params[:q])}) DESC")
      else
        hospitals = hospitals.where('hospitals.name LIKE ?', "%#{@query}%")
      end
    end

    hospitals.includes([:address])
  end

  private

  def postgres?
    defined?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter) && ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
  end
end
