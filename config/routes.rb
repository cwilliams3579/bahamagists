Rails.application.routes.draw do
  resources :categories
  resources :jobs
  devise_for :users, :controllers => { registrations: 'registrations'}
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :posts
  root to: 'visitors#index'
end
