Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  resources :users do
    resources :articles, only: %i[ show ]
  end

  resources :articles, only: %i[ index new create destroy edit update]
  get "my_articles", to: "articles#my_articles"

  resources :articles, only: %i[ index show ] do
    resources :comments, only: %i[ new create edit update ]
  end
  resources :comments, only: %i[ destroy ]

  get "my_comments", to: "comments#my_comments"

end
