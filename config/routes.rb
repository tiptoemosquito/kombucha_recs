Rails.application.routes.draw do
  get 'kombuchas/low_calories', to: 'kombuchas#low_calories'
  resources :kombuchas
  resources :flavors, only: [:index, :show] do
    resources :kombuchas, only: [:index, :show, :new]
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
  #change the route from /users/login to /login route

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
  end 

  devise_scope :user do 
    get 'signup', to: 'devise/registrations#new'
  end 

  root to: 'welcome#home'
  
end
