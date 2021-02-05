class ProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :bio, :featured_image, :cover_image, :headline, :occupations, :hometown, :status, :user

  # attribute :created_at do
  #   object.created_at.strftime("%B %d %Y")
  # end
  def featured_image
   if object.featured_image.attached?
     {
       url: rails_blob_url(object.featured_image)
     }
   end
 end

  # has_one :headline
  # has_one :status
  # has_many :occupations
  # has_one :hometown
  def user
    {
        id: object.user.id,
        email: object.user.email,
        birthday: object.user.birthday,
        first_name: object.user.first_name,
        middle_name: object.user.middle_name,
        last_name: object.user.last_name,
        phone: object.user.phone,
        gender: object.user.gender,
        neighborships: object.user.neighborships
      }
  end
end
