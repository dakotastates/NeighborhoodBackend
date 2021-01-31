class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :middle_name, :last_name, :phone, :gender, :birthday, :location, :profile
end
