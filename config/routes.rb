Rails.application.routes.draw do
  get 'home/index'
  # devise_for :trainers, controllers: 
  # {    registrations: "trainers/registrations",
  #      sessions: "trainers/sessions"       }

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
 

  root "users#index"
  resources :users do
    resources :addresses
    resources :memberships, only: [:new, :create] 
    resources :payments
    resources :enrollments
  end
  resources :trainer_coaches do
    resources :courses
  end

end