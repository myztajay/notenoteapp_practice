Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :notes
  
  # Creates an alternate root via Devise so that loggin in ppl can have a different root.
  authenticated :user do
    root 'notes#index', as: "authenticated_root"
  end
  
  root 'welcome#index'

end
