Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]                                          
  root 'users#index'
  resources :users, except: [:index ,:show, :update]
  resource :users, only: [:edit] do
    collection do
      patch 'updatepas'
    end
  end

  namespace :admin do
    resources :users do
      resources :waters, only: [:index, :show]
        collection do
          get 'hot_liders'
          get 'cold_liders'

      end
    end
  end

  resources :users do
    resources :waters
  end

end
