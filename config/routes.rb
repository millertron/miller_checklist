Rails.application.routes.draw do
	root to: 'checklists#index'
	
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	delete '/logout', to: 'sessions#destroy'

	resources :checklists
	resources :implementations
	
	get '/signup', to: 'users#new'
	resources :users
	
	get '/form_options', to: 'form_options#index'
	post '/form_options', to: 'form_options#create'
	get '/form_options/ajax', to: 'form_options#ajax'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
