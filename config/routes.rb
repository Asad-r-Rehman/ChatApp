Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chatroom
  resources :message
  get 'admin_right', to: 'chatroom#admin_right'
  get "chatArea" , to: "chatroom#chatarea"
  root "session#new"
  mount ActionCable.server, at: '/cable'
end
