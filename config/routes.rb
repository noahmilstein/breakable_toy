Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'home#index'
  resources :users

  devise_scope :users do
    authenticated :user do
      root "users#show"
    end
    unauthenticated :user do
      root "devise/sessions#new"
    end
  end
end
