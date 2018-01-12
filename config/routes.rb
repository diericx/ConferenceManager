Rails.application.routes.draw do
  resources :conferences
  devise_for :users
  resources :abstract_proposals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'abstract_proposals#index'
end
