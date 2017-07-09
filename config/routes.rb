Rails.application.routes.draw do
  resources :posts
  root to: 'visitors#index'
end
