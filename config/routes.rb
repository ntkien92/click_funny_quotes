Rails.application.routes.draw do
  get 'welcome/index'

  get 'auth/:provider/callback', to: 'welcome#create'

  resources :homes, only: [:index]
  root 'homes#index'
	# get 'auth/failure', to: redirect('/')
	# get 'signout', to: 'sessions#destroy', as: 'signout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
