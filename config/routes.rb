Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :collections, only: [:create]
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks, only: [:show, :destroy, :create, :update] do
    member do
      patch "favorite"
    end
    resources :comments, only: [:index]
  end

  resources :artwork_shares, only: [:create, :destroy] do
    member do
      patch "favorite"
    end
  end

  resources :comments, only: [:create, :destroy]
end
