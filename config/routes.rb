require 'sidekiq/web'
Rails.application.routes.draw do
  root "home#index"
  mount Sidekiq::Web => "/sidekiq"

  # get 'home/index'
  
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  
  resources :users do
    resources :addresses
    resources :memberships
    resources :payments
    resources :enrollments
  end
  resources :trainer_coaches do
    resources :courses
  end
end