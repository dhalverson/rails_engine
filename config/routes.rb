Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
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
