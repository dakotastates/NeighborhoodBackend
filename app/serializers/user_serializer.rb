class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :email, :first_name, :middle_name, :last_name, :phone, :gender, :birthday, :location, :featured_image, :neighborships

  has_one :profile
  # def profile
  #   {
  #       id: object.profile.id,
  #       bio: object.profile.bio,
  #       cover_image: object.profile.cover_image
  #   }
  # end
  def featured_image
   if object.profile.featured_image.attached?
     {
       url: rails_blob_url(object.profile.featured_image)
     }
   end
 end
end
