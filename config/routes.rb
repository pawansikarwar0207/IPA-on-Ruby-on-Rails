Rails.application.routes.draw do
  get 'user_plan/index'
  get 'questions/index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'home#index'

  resources :questions 

  resources :plans
  

  get '/add_user_plan', to: 'plans#add_user_plan' 

  resources :likes, only: [:create, :destroy]

  resources :questions do
    resources :user_reactions, only: [:create, :destroy]
    resources :questions, only: [:create, :destroy]
    resources :comments
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
