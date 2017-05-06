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
	get '/form_options/search', to: 'form_options#search'
	delete '/form_options', to: 'form_options#destroy'
	
	get '/analytics', to: 'analytics#index'
	get '/analytics/getsummary', to: 'analytics#get_summary'

	resources :activation, only: :edit
	
	namespace :api, path: '/', constraints: { subdomain: 'api'}, defaults: { format: :json } do
		namespace :v1 do
			resources :checklists, only: :index 
			resources :implementations, only: :create
			resources :authentication, only: :edit
		end
	end
end
