class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  has_one :location
  has_one :profile
  has_many :neighborships, dependent: :destroy
  has_many :neighbors, through: :neighborships
  accepts_nested_attributes_for :location, :profile, update_only: true

  after_create :init_profile

  def init_profile
    self.create_profile!
  end
end
