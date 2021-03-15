class Profile < ApplicationRecord
  belongs_to :user
  has_one :status
  has_one :headline
  has_one :hometown
  has_many :occupations
  has_one_attached :featured_image
  has_many_attached :images
  accepts_nested_attributes_for :status, :headline, :hometown, :occupations, update_only: true

  after_create :init_profile

  def init_profile
    self.create_status!
    self.create_headline!
    self.create_hometown!
  end
end
