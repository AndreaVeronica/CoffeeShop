Rails.application.routes.draw do
  devise_for :users
  resources :coffeeshops
  root to: 'static_pages#home'
  get 'home', to: 'static_pages#home', as: 'home'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'user_root', to: 'coffeeshops#index', as: :user_root

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
