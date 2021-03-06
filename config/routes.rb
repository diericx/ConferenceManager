Rails.application.routes.draw do
  get 'submissions/report'
  get 'submissions/all'
  get 'submissions/user_report'
  get 'submissions/final_decisions_report'
  post 'submissions/report'

  resources :reviewer_assignments
  resources :submission_reviews
  resources :conferences
  devise_for :users
  resources :submissions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'submissions#index'
end
