Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  devise_for :users
  root to: "pages#home_befor_login"

  get "/home_after_login" ,to: "pages#home_after_login", as: :home_after_login

  resources :question_and_answers, only: [:index]
  resources :coffee_machines
  resource :profile, only: [:show, :edit, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
