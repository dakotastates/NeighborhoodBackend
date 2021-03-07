class BulletinSerializer < ActiveModel::Serializer
  attributes :id, :user, :bulletin, :created_at

  attribute :created_at do
    object.created_at.strftime("%I:%M %p")
  end

end
