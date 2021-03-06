Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do
    collection do
      get "/show_profile", to: "users#show_profile", as: "my_profile"
      get "/show_log", to: "users#show_log", as: "my_log"
      get "/coach_index", to: "users#coach_index", as: "coach_index"
      get "/trainee_index", to: "users#trainee_index", as: "trainee_index"
      post "/request_admin", to: "users#request_admin", as: "request_admin"
    end
    resources :posts, only: [:new, :create]
  end

  get "tags/:tag", to: "videos#index", as: :tag

  resources :posts, except: [:new, :create] do
    resources :videos, except: [:show, :index, :new, :edit, :destroy]
  end
  resources :videos, except: [:create, :update] do
    collection do
      get "/search", to: "videos#search", as: "search"
    end
    resources :comments, except: [:show, :index]
  end
  resources :home, only: [:about] do
    collection do
      get "/about", to: "home#about", as: "about"
    end
  end
  root "home#index"
end
