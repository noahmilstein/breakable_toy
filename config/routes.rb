Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do
    collection do
      get '/show_profile', to: 'users#show_profile', as: 'my_profile'
      get '/show_log', to: 'users#show_log', as: 'my_log'
      get '/coach_index', to: 'users#coach_index', as: 'coach_index'
      get '/trainee_index', to: 'users#trainee_index', as: 'trainee_index'
      post '/request_admin', to: 'users#request_admin', as: 'request_admin'
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
