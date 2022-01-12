Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "ChatChennel" , to: "chatroom#new"
  get "ChatArea" , to: "chatroom#index"
  get "chatroomSection", to: "chatroom#new"
  root "session#new"
end
