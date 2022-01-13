Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chatroom
  resources :message

  # get "ChatChennel" , to: "chatroom#new"
  get "chatArea" , to: "chatroom#chatarea"
  # get "createChatRoom", to: "chatroom#index"
  root "session#new"
end
