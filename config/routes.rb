Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :forms do
    resources :categories, only: :create
  end
  resources :categories, only: :create do
    resources :questions, only: :create
  end

  resources :questions, only: :create do
    resources :answers, only: :create
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
