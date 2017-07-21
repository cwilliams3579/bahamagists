Rails.application.routes.draw do

  root to: 'visitors#index'

  resources :jobs do
    resources :reviews, except: [:show, :index]
  end
    resources :categories

  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :posts do
    resources :comments
  end

  #get 'job_category', to: 'categories#show'

end
