class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :email, :first_name, :middle_name, :last_name, :phone, :gender, :birthday, :location, :neighborships

  has_one :profile
  # def profile
  #   {
  #       id: object.profile.id,
  #       bio: object.profile.bio,
  #       cover_image: object.profile.cover_image
  #   }
  # end
end
