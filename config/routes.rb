Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :artworks, only: [:index, :show, :destroy, :create, :update]
  resources :artwork_shares, only: [:create, :destroy]
end
