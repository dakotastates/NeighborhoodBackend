class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update, :profile]
  before_action :find_user, only:[:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    if User.exists?(params[:id])
      render json: @user
    else
      render json: {notice: 'User does not exist' }
    end
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: @token }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @user.update(user_params)
      render json: @user
    else
      render json:{errors: @user.errors.full_messages}
    end
  end

  def destroy
    @user.destroy
    render json: { result: :ok }
  end


  private

  def user_params
    params.require(:user).permit( :id, :email, :password, :first_name, :middle_name, :last_name, :phone, :birthday, :gender,
      location_attributes: [:longitude, :latitude],
      profile_attributes: [:bio, :cover_image],
      neighborship_attributes: [:neighbor])
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end

end
