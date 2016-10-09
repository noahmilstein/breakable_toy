Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'home#index'

  devise_scope :user do
    authenticated :user do
      root "user#show"
    end
    unauthenticated :user do
      root "devise/sessions#new"
    end
  end



  root 'devise/sessions#new'
end
