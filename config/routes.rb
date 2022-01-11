Rails.application.routes.draw do
  devise_for :users

  resources :user_answers, only: [:index, :create]

  root to: 'pages#home'

  resources :forms do
    resources :categories, only: [:create, :show]
    resources :questions, only: :show
  end
  get '/user_forms/:id', to: 'forms#user_show', as: 'user_show'

  resources :categories, only: :create do
    resources :questions, only: :create
  end

  resources :questions, only: :create do
    resources :answers, only: :create
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
