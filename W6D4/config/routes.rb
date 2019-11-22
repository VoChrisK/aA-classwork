Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks, only:[:index, :create, :show, :update, :destroy] do
    resources :comments, only: [:index]
  end

  resources :artwork_shares, only:[:create, :destroy]

  resources :comments, only:[:create, :index, :destroy]

  # get "users", to: "users#index"
  # post "users", to: "users#create"
  # get "users/new", to: "users#new", as: 'new_user'
  # get "users/:id/edit", to: "users#edit", as: 'edit_user'
  # get "users/:id", to: "users#show", as: "user"
  # patch "users/:id", to: "users#update"
  # put "users/:id", to: "users#update"
  # delete "users/:id", to: "users#destroy"
  
  # get "artworks", to: "artworks#index"
  # post "artworks", to: "artworks#create"
  # get "artworks/new", to: "artworks#new", as: 'new_artwork'
  # get "artworks/:id/edit", to: "artworks#edit", as: 'edit_artwork'
  # get "artworks/:id", to: "artworks#show", as: "artwork"
  # patch "artworks/:id", to: "artworks#update"
  # put "artworks/:id", to: "artworks#update"
  # delete "artworks/:id", to: "artworks#destroy"
end
