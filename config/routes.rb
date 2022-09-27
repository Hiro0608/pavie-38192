Rails.application.routes.draw do
  get 'reservations/index'
  root 'reservations#index'
end
