Myapp::Application.routes.draw do

  root to: 'users#new'
  resources :users, only: [:create, :update, :new]

end
