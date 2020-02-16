Rails.application.routes.draw do

  get 'sessions/new'

  #Home page
  root 'static_pages#home'

  #Signup route
  get 'signup' => 'students#new'
  # post '/signup' => 'students#create'

  #Login route
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  resources :appointments
  resources :tutors
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
