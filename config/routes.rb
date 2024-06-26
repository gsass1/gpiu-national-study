Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  if Keycloak::enabled?
    devise_for :users, skip: [:registrations], controllers: { sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks' }

    # Disable normal devise sign up page
    as :user do
      if GPIU.allow_local_accounts?
        get 'users/new' => 'registrations#new', as: 'new_user_registration'
        post 'users' => 'registrations#create'
      end
      get 'users/edit' => 'registrations#edit', :as => 'edit_user_registration'
      match 'users' => 'registrations#update', :as => 'user_registration', via: [:patch, :put]
    end
  else
    devise_for :users
  end

  get '/finish_registration' => 'finish_registration#index'
  post '/finish_registration' => 'finish_registration#create'

  resources :notifications, only: [:index, :destroy]

  resources :support_requests, only: [:new, :create]

  resources :study_calendar, only: [:index]

  namespace :admin do
    resources :dashboard, only: :index
    resources :users do
      resources :roles, only: [:index, :create, :destroy]
    end
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
      post :revoke
      post :toggle_exportable
      get :export
    end
  end

  namespace :regional_admin do
    scope '/:country', as: :country do
      resources :dashboard, only: :index
      resources :users
      resources :hospitals do
        post :set_state
      end

      resources :study_iterations do
        post :create_study_range
        post :submit
        delete '/delete_study_range/:study_range_id' => 'study_iterations#delete_study_range', as: :delete_study_range
        get :export
        post :request_export_permission
        post :revoke
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
    post :toggle_lock
    resources :patient_identifications, only: [:edit, :update], path: :identifications, as: :identifications
    resources :uti_questionnaires, only: [:edit, :update]
    resources :ssi_questionnaires, only: [:edit, :update]
    resources :biopsy_questionnaires, only: [:edit, :update]
    resources :biopsy_outcome_questionnaires, only: [:edit, :update]

    # Prevents stupid 404 message when reloading questionnaire page after saving
    get '/:questionnaire/:id', to: redirect('/patients/%{patient_id}/%{questionnaire}/%{id}/edit')
  end

  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  get '/help/faq' => 'site#faq'
  get '/help' => 'site#help'
  get '/help/manual' => 'site#manual'

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  root 'site#index'
end
