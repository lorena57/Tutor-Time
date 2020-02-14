Rails.application.routes.draw do

  #Home page
  root 'static_pages#home'

  #Signup route
  get 'signup' => 'students#new'
  post '/signup' => 'students#create'

  #Logout route
  delete '/logout' => 'sessions#destroy' 

  resources :appointments
  resources :tutors
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
