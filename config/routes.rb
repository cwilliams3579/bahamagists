Rails.application.routes.draw do
  resources :comments
  root to: 'visitors#index'
  resources :jobs do
    resources :reviews, except: [:show, :index]
  end
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :posts
  resources :categories
end
