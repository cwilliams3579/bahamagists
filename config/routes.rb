Rails.application.routes.draw do
  get 'users/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, :controllers => { registrations: 'registrations'}
 
  resources :jobs do
    resources :reviews, except: [:show, :index]
  end

  resources :posts do
    resources :comments
  end
  
  resources :favorite_jobs, only: [:create, :destroy]
  resources :tags, only: [:show]
  
  resources :categories


  resources :events
  resources :listings
  resources :users, only: [:show]
  root to: 'posts#index'
end
