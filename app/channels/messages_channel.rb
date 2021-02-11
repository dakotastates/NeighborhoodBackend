class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages_channel'
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
