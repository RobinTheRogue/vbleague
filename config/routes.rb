Rails.application.routes.draw do

  devise_for :admins
  devise_for :users, :controllers => { :registrations => "registrations" }

  root  "home#index"
  #get 'home/index'

  get "contactspage" => 'contactspage#index'
  get "forms" => "forms#index"
  post "locations/:id/members" => "locations_members#create"
  delete "locations/:id/members" => "locations_members#destroy"
  post "locations/:id/courts" => "courts#create"
  delete "locations/:id/courts" => "courts#destroy"
  post "teams/:id/members" => "members_teams#create"
  delete "teams/:id/members" => "members_teams#destroy"

  resources :members do
  end

  resources :locations do
  end

  resources :contacts do
  end

  resources :news do
  end

  resources :newsletters do
  end

  resources :levels do
  end

  resources :divisions do
  end

  resources :teams do
  end

  resources :matches do
  end

end
