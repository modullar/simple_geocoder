Rails.application.routes.draw do
  root 'geocoder#index'
  get 'geocoder/index'
  get 'geocoder/geocode', to: 'geocoder#geocode'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
