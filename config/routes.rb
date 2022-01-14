Rails.application.routes.draw do
  devise_for :users


  root to: 'pages#home'

  resources :forms do
    resources :categories, only: [:create, :show]
    resources :questions, only: :show
  end
  get '/user_forms/:id', to: 'forms#user_show', as: 'user_show'
  get '/user_index', to: 'forms#user_index', as: 'user_index'

  resources :categories, only: :create do
    resources :questions, only: :create
  end

  resources :questions, only: :create do
    resources :answers, only: :create
  end

  resources :answers, only: :destroy do
    resources :user_answers, only: [:index, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
