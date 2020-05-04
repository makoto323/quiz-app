Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users
  root to: "home#index"
  resources :quizzes do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users
end
