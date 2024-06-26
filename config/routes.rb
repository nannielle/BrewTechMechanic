Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  devise_for :users
  
  root to: "pages#home_befor_login"

  get "/home_after_login" ,to: "pages#home_after_login", as: :home_after_login

  # resources :question_and_answers, only: [:index ]
  resources :question_and_answers do
    resources :reviews, only: [:create]
  end
  resources :coffee_machines
  resources :error_messages, only: [:show]
  resources :user_coffee_machines, only: [:create]

  resource :profile, only: [:show, :edit, :update]

  get 'my_coffeemachine', to: 'coffee_machines#my_coffeemachine'

  # Route to handle the form submission
  post 'contact_manufacture', to: 'support#create', as: :manufacture_contact
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
