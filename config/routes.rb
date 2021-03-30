Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :roles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'

  scope '/admin' do
    resources :users
  end
end
