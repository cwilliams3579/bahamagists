Rails.application.routes.draw do
  resources :comments
  
  root to: 'visitors#index'
  
  resources :jobs do
    resources :reviews, except: [:show, :index]
  end
    resources :categories
  
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :posts

  get 'job_category', to: 'categories#show' 

end
