Rails.application.routes.draw do
  root  "home#index"
  #get 'home/index'

  get "forms" => "forms#index"
end
