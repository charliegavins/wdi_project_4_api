Rails.application.routes.draw do
  resources :transactions
  resources :users
  get 'address', to: 'bitcoin#generate_address'
  post '/', to: 'bitcoin#ngrok'
  post 'register', to: 'authentications#register'
  post 'login', to: 'authentications#login'
  post '/cable', to: 'websocket#initialize_session'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
