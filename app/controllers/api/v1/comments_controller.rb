class Api::V1::CommentsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
  # before_action :find_bulletin, only:[:show, :update, :destroy]

  # before_action :authorized
  before_action do
    @bulletin = Bulletin.find(params[:bulletin_id])
  end

  def index
    @comments = @bulletin.comments
    # @users = User.where.not(id: current_user.id)
    # @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    render json: @comments
  end

  def create
    @comment = bulletin.comments.new(comment_params)

    if @comment.valid?
      render json: { comment: @comment}, status: :created
    else
      render json: { error: @comment.errors.full_messages }, status: :not_acceptable
    end
    # byebug
    # if Conversation.between(conversation_params[:sender_id], conversation_params[:receiver_id]).present?
    #   @conversation = Conversation.between(conversation_params[:sender_id], conversation_params[:receiver_id]).first
    # else
    #   @conversation = Conversation.create!(conversation_params)
    # end
    # ActionCable.server.broadcast 'conversations_channel', serialized_data
    #  head :ok
    render json: @comment

    # redirect_to conversation_messages_path(@conversation)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id)
    end

    # def find_bulletin
    #   @bulletin = Bulletin.find_by_id(params[:id])
    # end
end
