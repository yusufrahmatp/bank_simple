Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users

  get 'users/:id/add', to: 'transactions#add_new', as: "add"
  post 'users/:id/add', to: 'transactions#add_create'
  get 'users/:id/withdraw', to: 'transactions#withdraw_new', as: "withdraw"
  post 'users/:id/withdraw', to: 'transactions#withdraw_create'
  get 'users/:id/history', to: 'transactions#show', as: "history"
  
  root 'sessions#new'
end
