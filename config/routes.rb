Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "home#index"

  get 'friends/notifications', :to => 'friends#notifications'
  get 'home/feed', :to => 'posts#index'
  post 'friends/accept', :to => 'friends#accept'
  post 'friends/unfriend', :to => 'friends#unfriend'
  get 'friends/list', :to => 'friends#list'

  resources :users
  resources :friends
  resources :comments
  resources :likes, only: [:create, :destroy]

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    member do
      get :comments
      resources :comments, only: [:create, :edit, :update, :destroy] do
          resources :likes, only: [:create,:destroy]
      end
      resources :likes, only: [:create, :destroy], as: :post_likes
    end
  end
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user
  post 'posts/like', :to => 'posts#like'
  post 'posts/unlike', :to => 'posts#unlike'

  get '/users/:id', to: 'users#show', as: 'profile'
  get 'users/edit', :to => 'users#edit'
end
