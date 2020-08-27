Rails.application.routes.draw do
  root to: "dashboard#index"
  resources :doctors, only: %i(index new create edit destroy)
end
