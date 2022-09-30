Rails.application.routes.draw do
  devise_for :users
  root to: 'reservations#index'
  resources :reservations
  #get 'reservations/index'
  #root 'reservations#index'
  #ゲストログイン機能
  #devise_for :users, controllers: {
    #registrations: 'users/registrations',
    #passwords: 'users/passwords'
  #} 
  #devise_scope :user do
    #post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  #end
  #ゲストログイン機能
end
