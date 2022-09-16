Rails.application.routes.draw do
  devise_for :users
  namespace :users do
    resources :twitter_users do
      member do
        get :followees
        get :followers
        get :tweets
        post :follow, to: "followings#create"
        post :unfollow, to: "followings#destroy"
      end
    end
  end
  
  resources :tweets do
    member do
      get :like
      get :dislike
    end
  end

  # resource :followings, only: [:create, :destroy]
  # post '/twitter_users/:id/follow', to: "followings#create", as: "follow_user"
  # post '/twitter_users/:id/unfollow', to: "followings#destroy", as: "unfollow_user"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
