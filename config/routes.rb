Rails.application.routes.draw do
  devise_for :users
   root 'tops#index'
   resources :tops 
   resources :tweets
   resources :users
   resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
