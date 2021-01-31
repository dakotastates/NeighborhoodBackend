class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  has_one :location
  has_one :profile
  accepts_nested_attributes_for :location, :profile, update_only: true
end
