App.chattroom = App.cable.subscriptions.create "ChattroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->

   $(".message-quict").append data.mod_message
   $(".del_msg_#{message.id}").remove
