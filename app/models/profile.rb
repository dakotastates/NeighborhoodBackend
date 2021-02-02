class Profile < ApplicationRecord
  belongs_to :user
  has_one :status
  has_one :headline
  has_one :hometown
  has_many :occupations
  accepts_nested_attributes_for :status, :headline, :hometown, :occupations
end
