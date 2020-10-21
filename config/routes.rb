Rails.application.routes.draw do
  get '/api/v1/items/:id/merchants', to: 'items/merchant#index'
  get '/api/v1/merchants/:id/items', to: 'merchants/items#index'

  namespace :api do
    namespace :v1 do
      resources :merchants, :items
    end
  end
end
