Rails.application.routes.draw do
  devise_for :users
   root 'tweets#index'
   resources :tops 
   resources :tweets do
    resources :comments, only: [:create]
   end                 #tweets_controllerに対してのresourcesメソッド
   resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
