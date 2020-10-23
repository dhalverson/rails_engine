Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/:id/items', to: 'items#index'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/most_revenue', to: 'revenue#index'
      end
      namespace :items do
        get '/:id/merchant', to: 'merchant#index'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :merchants, :items
    end
  end
end
