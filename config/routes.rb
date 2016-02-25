Myapp::Application.routes.draw do

  root to: 'users#landing'
  resources :users, only: [:create, :update]

end
