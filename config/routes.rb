Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root  "home#index"
  #get 'home/index'

  get "forms" => "forms#index"

  resources :news do
  end

  resources :newsletters do

  end
end
