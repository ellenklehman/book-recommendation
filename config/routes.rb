Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root to: 'books#index'
  resources :lists do
    resources :books
  end
  resources :users, only: [:show]
end
