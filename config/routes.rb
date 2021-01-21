Rails.application.routes.draw do
  get 'messages/index'
  post '/top/guest_sign_in', to: 'top#new_guest'
  devise_for :users
  get 'top/index'
  root to: "top#index"
  resources :attendances, only: [:index, :new, :create]
  resources :prints, only: [:index, :new, :create]
  resources :messages, only: :index 
  resources :rooms, only: [:index, :new, :create]
  
end
