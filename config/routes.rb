Rails.application.routes.draw do
  resources :users
  root to: 'apps#index'

  get 'apps/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
