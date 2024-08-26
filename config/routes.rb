Rails.application.routes.draw do
  namespace :sales do
    root to: 'home#index'
    get '/login', to: 'login#index'
    get '/signup', to: 'login#signup'
    post '/login/confirm', to: 'login#confirm_login', as: 'confirm_login'
    post '/signup/new-signup', to: 'login#create', as: 'new_signup'
    get '/logout', to: 'login#logout', as: 'logout'
    get 'home/index'
    resources :sellers, except: [:index, :new] do
      resources :addresses
      resources :bank_accounts
      resources :courses do
        resources :videos
      end
    end
  end

  namespace :admin do
    resources :administrators
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end 
