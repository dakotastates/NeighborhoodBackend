class BulletinSerializer < ActiveModel::Serializer
  attributes :id, :user, :bulletin, :created_at, :comments

  attribute :created_at do
    object.created_at.strftime("%I:%M %p")
  end

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
        neighborships: object.user.neighborships,
        profile: object.user.profile
      }
  end


end
