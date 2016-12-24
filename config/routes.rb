Rails.application.routes.draw do
  get 'welcome/index'

  resources :homes, only: [:index]
  resources :quotes
  resources :test, only: [:index]
  root 'homes#index'
  # get 'auth/failure', to: redirect('/')
  # get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/auth/:provider/callback' => 'quotes#result'
  get '/signin' => 'sessions#new'
  get '/admin/upload_quote' => 'admins#upload_quote'
  post '/admin/save_quote' => 'admins#save_quote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
