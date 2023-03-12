Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "articles/search", to: "articles#search"
  resources :articles, only: %i[index show create new] do
    resources :bookings, only: %i[new create] do
      get "confirm"
    end
  end
  resources :bookings, only: %i[show index update] do
  end

  get "api/address-from-coordinates", to: "api#address_from_coordinates"
end
