Rails.application.routes.draw do
  get 'abstract_proposals/report'

  resources :abstract_reviewer_assignments
  resources :abstract_reports
  resources :conferences
  devise_for :users
  resources :abstract_proposals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'abstract_proposals#index'
end
