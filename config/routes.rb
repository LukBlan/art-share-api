Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks, only: [:show, :destroy, :create, :update] do
    resources :comments, only: [:index]
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]
end
