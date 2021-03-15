class Api::V1::ProfilesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update, :profile]
  before_action :find_profile, only:[:show, :update, :destroy]

  before_action do
       @user = User.find(params[:user_id])
  end

  def index
      @profile = @user.profile
      render json: @profile
  end

  def create
    @profile = @user.profile.create(profile_params)

    if @profile.valid?

      render json: { profile: @profile}, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @profile.errors.full_messages }, status: :not_acceptable
    end
  end

  def update

    if @user.profile.update(profile_params)
      render json: @user.profile
    else
      render json:{errors: @user.profile.errors.full_messages}
    end
  end

  def destroy
    @profile.destroy
    render json: { result: :ok }
  end


  private

  def profile_params
    params.require(:profile).permit( :id, :bio, :featured_image, :images, :cover_image,
      headline_attributes: [:headline, :visable],
      hometown_attributes: [:hometown, :visable],
      occupation_attributes: [:company, :position, :city, :description, :start_date, :end_date, :visible],
      status_attributes: [:status, :visable])
  end

  def find_profile
    @profile = Profile.find_by_id(params[:id])
  end

end
