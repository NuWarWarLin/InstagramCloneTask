Rails.application.routes.draw do
  
  resources :posts do
    collection do
      post :confirm
    end
  end

  root 'sessions#new'

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :favorites
  
end
