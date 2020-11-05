Rails.application.routes.draw do
  devise_for :users

  resources :notifications, only: [:index]

  resources :support_requests, only: [:new, :create]

  resources :study_calendar, only: [:index]

  namespace :admin do
    resources :dashboard, only: :index
    resources :users
    resources :hospitals
    resources :support_requests
    resources :patients
    resources :patient_identifications
    resources :countries
    resources :departments
    resources :department_questionnaires
    resources :study_iterations, only: [:index, :show] do
      post :approve
      post :reject
      get :export
    end
  end

  namespace :regional_admin do
    scope '/:country', as: :country do
      resources :dashboard, only: :index
      resources :users
      resources :hospitals

      resources :study_iterations do
        post :create_study_range
        post :submit
        delete '/delete_study_range/:study_range_id' => 'study_iterations#delete_study_range', as: :delete_study_range
      end
    end
  end

  resources :dashboard, only: [:index]
  resources :hospitals do
    resources :departments, only: [:new, :create] do
      resources :department_questionnaires, only: [:edit, :update]
      resources :employees, only: [:create, :destroy]
      resources :patients, only: [:new, :create]
    end
  end

  resources :patients, only: [:index] do
    resources :patient_identifications, only: [:edit, :update], path: :identifications, as: :identifications
      resources :uti_questionnaires, only: [:edit, :update]
      resources :ssi_questionnaires, only: [:edit, :update]
      resources :biopsy_questionnaires, only: [:edit, :update]
      resources :biopsy_outcome_questionnaires, only: [:edit, :update]
  end

  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  root 'site#index'
end
