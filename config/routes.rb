Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :dashboard, only: :index
    resources :users
    resources :hospitals
  end

  resources :dashboard, only: [:index]
  resources :hospitals do
    resources :departments, only: [:new, :create] do
      resources :employees, only: [:create, :destroy]
    end
  end

  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  root 'site#index'
end
