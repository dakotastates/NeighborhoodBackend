class Api::V1::BulletinsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
  # before_action :find_bulletin, only:[:show, :update, :destroy]

  # before_action :authorized

  def index
    @bulletins = Bulletin.all
    # @users = User.where.not(id: current_user.id)
    # @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    render json: @bulletins
  end

  def create
    @bulletin = Bulletin.create(bulletin_params)

    if @bulletin.valid?
      render json: { bulletin: @bulletin}, status: :created
    else
      render json: { error: @bulletin.errors.full_messages }, status: :not_acceptable
    end
    # byebug
    # if Conversation.between(conversation_params[:sender_id], conversation_params[:receiver_id]).present?
    #   @conversation = Conversation.between(conversation_params[:sender_id], conversation_params[:receiver_id]).first
    # else
    #   @conversation = Conversation.create!(conversation_params)
    # end
    # ActionCable.server.broadcast 'conversations_channel', serialized_data
    #  head :ok
    # render json: @bulletin

    # redirect_to conversation_messages_path(@conversation)
  end

  private
    def bulletin_params
      params.require(:bulletin).permit(:bulletin, :user_id)
    end

    def find_bulletin
      @bulletin = Bulletin.find_by_id(params[:id])
    end
end
