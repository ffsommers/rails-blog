Rails.application.routes.draw do
  devise_for :users, controllers: {
  	 sessions: 'users/sessions'
  }
 
  get 'welcome/index'
  	resources :articles do
      resources :comments
     end 
  root 'welcome#index'
  
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  resources :messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
