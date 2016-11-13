Rails.application.routes.draw do
  devise_for :users, controllers: {
  	 sessions: 'users/sessions'
  }

  resources :chat_rooms, only: [:new, :create, :show, :index]
  root 'chat_rooms#index'

  resources :articles, only: [:new, :create, :show, :update, :index,:destroy  ]
  resources :comments, only: [:new, :destroy]


  mount ActionCable.server => '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# GET /photos photos#index  display a list of all photos
# GET /photos/new photos#new  return an HTML form for creating a new photo
# POST  /photos photos#create create a new photo
# GET /photos/:id photos#show display a specific photo
# GET /photos/:id/edit  photos#edit return an HTML form for editing a photo
# PATCH/PUT /photos/:id photos#update update a specific photo
# DELETE  /photos/:id photos#destroy  delete a specific photo
