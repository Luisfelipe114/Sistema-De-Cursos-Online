Rails.application.routes.draw do
  root to: 'home#index'

  namespace :marketplace do
    # get 'checkout/index' => observaçãoo(QUERY PARAMS): o helper gerado disso seria marketplace_checkout_index_path. se eu quiser passar query params para a rota, eu chamaria ele marketplace_checkout_index_path(query_param: value, query_param2: value2, etc...)
    root to: 'home#index'
    resources :courses, only: [:show] 
    get '/checkout/:course_id', to:'checkout#index', course_id: /\d+/, as: 'checkout'
    # get '/:course_id', to: 'home#'
  end

  namespace :client do
    resources :users, only: [:edit, :update]
    get '/login', to: 'login#index'
    get '/signup', to: 'login#signup'
    post '/login/confirm', to: 'login#confirm_login', as: 'confirm_login'
    post '/signup/new-signup', to: 'login#create', as: 'new_signup'
    get '/logout', to: 'login#logout', as: 'logout'

    get '/courses/:course_id/videos/:video_id', to: 'courses#show', course_id: /\d+/, video_id:  /\d+/, as: 'show_course'
    root to: 'home#index'
  end

  namespace :sales do
    get 'youtube/redirect'
    root to: 'home#index'
    get 'home/index'

    get '/login', to: 'login#index'
    get '/signup', to: 'login#signup'
    post '/login/confirm', to: 'login#confirm_login', as: 'confirm_login'
    post '/signup/new-signup', to: 'login#create', as: 'new_signup'
    get '/logout', to: 'login#logout', as: 'logout'

    get '/youtube-response', to: 'youtube#redirect'
    post '/upload-video', to: 'youtube#upload'

    resources :sellers, except: [:index, :new] do
      resources :addresses
      resources :bank_accounts
      resources :courses do
        resources :videos
      end
    end
  end

  namespace :admin do
    get '/login', to: 'login#index'
   # get '/signup', to: 'login#signup'
    post '/login/confirm', to: 'login#confirm_login', as: 'confirm_login'
   # post '/signup/new-signup', to: 'login#create', as: 'new_signup'
    get '/logout', to: 'login#logout', as: 'logout'
    resources :categories
    resources :administrators
    root to: 'administrators#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end 
