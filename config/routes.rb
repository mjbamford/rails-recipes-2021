Rails.application.routes.draw do
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :comments, only: [:index, :new, :create]
  end

  # resource :session, only: [:show, :new, :create, :destroy]

  root to: 'recipes#index'
end
