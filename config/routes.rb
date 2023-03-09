Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "articles#index"
  get "articles/search", to: "articles#search"
  resources :articles, only: %i[index show create new] do
    resources :bookings, only: %i[new create] do
      get "confirm"
    end
  end
  resources :bookings, only: %i[index destroy] do
  end

  # refactorer les routes et les link_to et redirect_to
  get "articles/:id/bookings/new", to: "bookings#new"
  post "bookings/:id", to: "bookings#create"

  get "bookings/", to: "bookings#index"
end
