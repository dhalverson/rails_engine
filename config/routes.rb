Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/items/find', to: 'items/find#show'
      get '/items/find_all', to: 'items/find#index'
      get '/merchants/find', to: 'merchants/find#show'
      get '/merchants/find_all', to: 'merchants/find#index'
      get '/merchants/most_revenue', to: 'merchants/revenue#index'
      resources :merchants, :items
      namespace :merchants do
        get '/:id/items', to: 'items#index'
      end
      namespace :items do
        get '/:id/merchants', to: 'merchant#index'
      end
    end
  end
end
