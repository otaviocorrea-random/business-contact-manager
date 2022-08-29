Rails.application.routes.draw do
  root to: "auth#login"

  resources :plant_species
  resources :productive_properties
  resources :business_contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
