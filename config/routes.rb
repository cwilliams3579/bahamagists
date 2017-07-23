Rails.application.routes.draw do
  resources :listings
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'visitors#index'

  resources :jobs do
    resources :reviews, except: [:show, :index]
  end
  
  resources :favorite_jobs, only: [:create, :destroy]
  
  resources :categories

  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :posts do
    resources :comments
  end

  #get 'job_category', to: 'categories#show'
end
