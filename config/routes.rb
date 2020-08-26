Rails.application.routes.draw do
  resources :doctors, only: %i(index edit destroy)
end
