Rails.application.routes.draw do
  resources :matches
  resources :championnats
  # get 'admin/index'

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/admin', to: 'admin#index'
end
