class Api::V1::ConversationsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
  # before_action :authorized

  def index
    @users = User.where.not(id: current_user.id)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    render json: @conversations
  end

  def create
    # byebug
    if Conversation.between(conversation_params[:sender_id], conversation_params[:receiver_id]).present?
      @conversation = Conversation.between(conversation_params[:sender_id], conversation_params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    ActionCable.server.broadcast 'conversations_channel', serialized_data
     head :ok
    render json: @conversation

    # redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.require(:conversation).permit(:sender_id, :receiver_id)
    end
end
