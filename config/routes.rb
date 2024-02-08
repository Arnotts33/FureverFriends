Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  get 'dashboard', to: 'dashboard#index'
  get 'profiles', to: 'profiles#update'
  resources :quizzes, only: [:index] do
    post 'submit', on: :collection
  end
  resources :breeds, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :profiles, only: [:show, :new, :create, :edit, :update]

  resources :breeds, only: [:index, :show]
end
