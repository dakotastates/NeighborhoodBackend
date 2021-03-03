class ConversationSerializer < ActiveModel::Serializer
  # ActionView::Helpers::DateHelper
  attributes :id, :sender_id, :receiver_id, :updated_at_ago
  has_many :messages
  belongs_to :sender
  belongs_to :receiver

  attribute :updated_at_ago do
    object.updated_at.strftime("%b %e %I:%M %p")
    # from_time = (object.updated_at).ago
    # time_ago_in_words(object.updated_at)
  end
end
