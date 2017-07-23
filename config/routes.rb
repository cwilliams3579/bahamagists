Rails.application.routes.draw do
  resources :listings
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'visitors#index'
  resources :jobs do
    resources :reviews, except: [:show, :index]
  end
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :posts
  resources :categories
end
