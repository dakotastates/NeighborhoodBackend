class Neighborship < ApplicationRecord
  belongs_to :user
  belongs_to :neighbor, class_name: 'User'
end
