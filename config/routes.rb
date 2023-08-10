Rails.application.routes.draw do
  # get 'bookmarks/new'
  root to: "lists#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists do
    resources :bookmarks
  end
  resources :bookmarks, only: %i[destroy]
end
