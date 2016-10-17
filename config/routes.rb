Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do
    collection do
      get '/show_profile', to: 'users#show_profile', as: 'my_profile'
      get '/show_log', to: 'users#show_log', as: 'my_log'
    end
    resources :posts, only: [:new, :create, :show]
  end

  resources :posts do
    resources :videos
  end

  resources :videos do
    resources :comments
  end

  root 'home#index'
end
