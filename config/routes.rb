Rails.application.routes.draw do
  get 'users/:id', to: 'users#show', as: 'user'

  resources :dishes
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
	get "sign_in", to: 'devise/sessions#new'
	delete "sign_out", to: 'devise/sessions#destroy'
	get "sign_up", to: 'devise/registrations#new'  
  end
  root 'pages#home'
	get 'about', to: 'pages#about'
	get 'contact', to: 'pages#contact'
  get 'tweets', to: 'tweets#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
