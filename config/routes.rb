Rails.application.routes.draw do
  resources :tickets, only: [:create]
  resources :guests, only: [:index]
  resources :theaters, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
