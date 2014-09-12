Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root to: 'books#index'

  resources :users, only: [:show] do
    resources :lists
  end

  resources :lists, only: [:show] do
    resources :books
  end
end
