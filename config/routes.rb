Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :profiles
      end
      resources :conversations, only: [:index, :create] do
        resources :messages, only: [:index, :create]
      end

      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

    end
  end
end
