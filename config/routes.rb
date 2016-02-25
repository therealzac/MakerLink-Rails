Myapp::Application.routes.draw do

  root to: 'static_pages#root'
  resources :users, only: [:create, :update]
  resource :sessions, only: [:show, :create, :destroy]

end
