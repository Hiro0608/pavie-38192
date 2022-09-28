Rails.application.routes.draw do
  get 'reservations/index'
  devise_for :users
  root 'reservations#index'
end
