Rails.application.routes.draw do
  resources :transactions do
    collection do
      post :webhook
    end
  end
  resources :users
  get 'address', to: 'bitcoin#generate_address'
  get 'exchange', to: 'bitcoin#exchange'
  post '/', to: 'bitcoin#ngrok'
  post 'register', to: 'authentications#register'
  post 'login', to: 'authentications#login'
  mount ActionCable.server => '/cable'
end
