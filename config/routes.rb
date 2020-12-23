Rails.application.routes.draw do
  devise_for :users
  get 'top/index'
  root to: "top#index"
  resources :attendances, only: [:index, :new, :create]
  resources :prints, only: [:index, :new, :create]
end
