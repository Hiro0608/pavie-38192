Rails.application.routes.draw do
  devise_for :users
  get 'reservations/index'
  root 'reservations#index'
end
