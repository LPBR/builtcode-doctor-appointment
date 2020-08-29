Rails.application.routes.draw do
  root to: "dashboard#index"
  resources :doctors
  resources :patients
  resources :appointments
end
