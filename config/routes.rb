Rails.application.routes.draw do
  get 'welcome/index'

  resources :homes, only: [:index]
  resources :quotes
  root 'homes#index'
	# get 'auth/failure', to: redirect('/')
	# get 'signout', to: 'sessions#destroy', as: 'signout'
	get '/auth/:provider/callback' => 'sessions#create'
	get '/signin' => 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
