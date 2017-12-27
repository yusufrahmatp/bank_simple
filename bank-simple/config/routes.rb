Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  get 'banks', to: 'banks#index'
  post 'banks', to: 'banks#create'
  get 'banks/new', to: 'banks#new'
  get 'banks/login', to: 'banks#login'
end
