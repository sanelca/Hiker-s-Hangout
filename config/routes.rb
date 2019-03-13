Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "home#index"
  resources :users, only: [:index, :show, :edit]
  resources :friends
  resources :comments
  resources :likes

  resources :posts do
    member do
      get :comments
      resources :comments, only: [:create, :edit, :update, :destroy] do
        resources :likes, only: [:create,:destroy]
      end
      resources :likes, only: [:create, :destroy], as: :post_likes
    end
  end


end
