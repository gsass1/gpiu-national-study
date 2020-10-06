Rails.application.routes.draw do
  devise_for :users

  resources :notifications, only: [:index]

  resources :support_requests, only: [:new, :create]

  namespace :admin do
    resources :dashboard, only: :index
    resources :users
    resources :hospitals
    resources :support_requests
    resources :study_iterations, only: [:index, :show] do
      post :approve
      post :reject
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
      resources :employees, only: [:create, :destroy]
      resources :patients, only: [:new, :create]
    end
  end

  resources :patients, only: [:index] do
    resources :patient_identifications, only: [:edit, :update], path: :identifications, as: :identifications
  end

  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  root 'site#index'
end
