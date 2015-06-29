# require_relative '../../db/config'

class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :contact_ids
  has_many :contacts, through: :contact_ids, source: :contact
  has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
  has_and_belongs_to_many :received_messages, class_name: "Message"

  def contacts_info
    self.contacts.map do |contact|
      {username: contact.username, public_key: contact.public_key}
    end
  end
end
