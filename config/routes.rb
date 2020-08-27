Rails.application.routes.draw do
  root to: "dashboard#index"
  resources :doctors, only: %i(index edit destroy)
end
