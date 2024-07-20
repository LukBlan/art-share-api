Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update]
end
