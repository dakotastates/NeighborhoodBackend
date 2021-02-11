class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :receiver_id
  has_many :messages
  belongs_to :sender
  belongs_to :receiver 
end
