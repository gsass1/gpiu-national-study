Rails.application.routes.draw do
  devise_for :users

  resources :dashboard, only: [:index]

  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  root 'site#index'
end
