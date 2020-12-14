Rails.application.routes.draw do
  get 'kombuchas/alcohol', to: 'kombuchas#alcohol'
  resources :flavors
  resources :kombuchas
  
  resources :flavors, only: [:index, :show] do
    resources :kombuchas, only: [:index, :show, :new]
  end

  devise_for :users, :controllers => {:registrations => 'registrations', omniauth_callbacks: 'callbacks'}

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end 

  root to: 'welcome#kombucha_home'
  
end
