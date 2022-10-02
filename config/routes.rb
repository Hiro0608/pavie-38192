Rails.application.routes.draw do
  devise_for :users
  root to: 'reservations#index'
  resources :reservations, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create 
  end
  resources :users, only: :show
end
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
