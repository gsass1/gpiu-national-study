Rails.application.routes.draw do
  devise_for :users

  resources :dashboard, only: [:index]
  resources :hospital

  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  root 'site#index'
end
