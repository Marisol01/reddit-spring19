Rails.application.routes.draw do
 
    #controller  action
  root 'subs#index'

  # get 'subs/index'
  # get 'subs/show'
  # get 'subs/new'
  # get 'subs/edit'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'subs#index'
  resources :subs
    # resources :topics

end
