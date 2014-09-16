Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root to: 'users#show'

  resources :users, only: [:show]
  resources :lists
  resources :books

end
