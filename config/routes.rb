Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :merchants, :items
      get 'items/:id/merchants', to: 'items/merchant#index'
    end
  end
end
