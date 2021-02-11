class Api::V1::MessagesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
  # before_action :authenticate

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index

    @messages = @conversation.messages

    @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)
    # byebug
    # if @messages.last
    #   if @messages.last.user_id != current_user.id
    #     @messages.last.read = true;
    #   end
    # end

    render json: @messages
    # @message = @conversation.messages.new
  end

  def create
    # byebug
    @message = @conversation.messages.new(message_params)
    # @message.user = current_usser

    if @message.save
      ActionCable.server.broadcast 'messages_channel', message
      head :ok
    else
      head :ok
      # render json: @message
      # redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end
