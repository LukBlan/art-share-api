Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:show, :destroy, :create, :update]
  resources :artwork_shares, only: [:create, :destroy]
end
