Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/hello', to: 'recipes#index'
  root to: 'recipes#index'
end
