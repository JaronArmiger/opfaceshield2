Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :accounts, except: [:index, :destroy]
  resources :addresses, except: [:index, :show]
  resources :orders, except: [:edit, :update]
  resources :posts, except: [:index]
  namespace :admin do
  	resources :accounts
  	resources :addresses
  	resources :orders do
      collection do
        get :processed, :unprocessed
      end
    end

  end
end
