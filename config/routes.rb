Rails.application.routes.draw do


  # resources :answers
  # resources :challendes
  # resources :chapters
  
  devise_for :users
  resources  :enrolls
  
  resources :courses do
    resources :chapters , shallow:true
  end
  
  resources :chapters do
     resources :challenges , shallow:true
  end
  
  resources :challenges do
     resources :answers , shallow:true 
  end
  
  get '/about', to: 'pages#about'

  get '/help', to: 'pages#help'
  get 'persons/profile', as: 'user_root'
  
   root 'pages#home'

end
