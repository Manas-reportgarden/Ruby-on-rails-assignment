Rails.application.routes.draw do

  resources :colleges
  resources :students
  get '/display', to: 'displays#form'
  post '/display', to: 'students#filter'

   root 'displays#form'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
