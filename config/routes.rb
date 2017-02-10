Rails.application.routes.draw do
  # get 'users/:username', to:'users#show', as: 'user'
  # get 'tweets', to: 'ideas#index'

  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: "follows#destroy"
    end
  end
  resources :ideas
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get "signin", to: 'devise/sessions#new'
  	delete "signout", to: 'devise/sessions#destroy'
  	get "signup", to: 'devise/registrations#new'
  end
	# defines path structure for application
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
