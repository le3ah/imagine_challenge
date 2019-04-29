Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :carriers do
        get "/find", to: 'search#show'
      end
      namespace :clients do
        get "/find", to: 'search#show'
      end
      namespace :policies do
        get "/find", to: 'search#show'
        get "/find_all", to: 'search#index'
      end
      resources :carriers, only: [:index]
      resources :clients, only: [:index]
      resources :policies, only: [:index]
    end
  end
end
