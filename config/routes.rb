Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/files', to: 'static_pages#files'
  get '/cancel', to: 'static_pages#paypal_cancel', as: 'paypal_cancel'
  get '/completed', to: 'static_pages#paypal_completed', as: 'paypal_completed'
  resources :accounts, except: [:index, :destroy]
  resources :addresses, except: [:index, :show]
  resources :orders, except: [:edit, :update]
  resources :posts
  resources :articles
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
