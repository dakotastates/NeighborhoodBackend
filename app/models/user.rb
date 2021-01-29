class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  has_one :location
  accepts_nested_attributes_for :location, update_only: true
end
