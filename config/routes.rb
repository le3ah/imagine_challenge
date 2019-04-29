Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :carriers do
        get "/find", to: 'search#show'
        get "/total_count", to: 'count#show'
      end
      namespace :clients do
        get "/find", to: 'search#show'
        get "/total_count", to: 'count#show'
        get "/:id/policies", to: 'policies#index'
      end
      namespace :policies do
        get "/find", to: 'search#show'
        get "/find_all", to: 'search#index'
        get "/total_count", to: 'count#show'
      end
      resources :carriers, only: [:index]
      resources :clients, only: [:index, :show]
      resources :policies, only: [:index]
    end
  end
end
