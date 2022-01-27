Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :forms do
    resources :categories, only: %i[create show]
    get '/forms/:form_id/user_categories/:id', to: 'categories#user_show', as: 'user_category'
    resources :questions, only: :show
    resources :user_answers, only: :index, as: 'user_results'
    get '/analysis', to: 'user_answers#analysis'
    resources :comments, only: %i[new create]
  end
  get '/user_forms/:id', to: 'forms#user_show', as: 'user_show'
  get '/user_index', to: 'forms#user_index', as: 'user_index'

  resources :categories, only: %i[create show] do
    resources :questions, only: :create
    resources :comments, only: %i[new create update]
  end

  resources :comments, only: :destroy

  resources :questions, only: :create do
    resources :answers, only: :create
  end

  resources :answers, only: :destroy do
    resources :user_answers, only: %i[index create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
