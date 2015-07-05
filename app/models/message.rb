# require_relative '../../db/config'

class Message < ActiveRecord::Base
  belongs_to :group
  has_many :messagings
  belongs_to :sender, class_name: "User"
  has_and_belongs_to_many :recipients, class_name: "User"

  # def self.allowed_people
  #   Message.select { |message| ( (message.sender == user) || (message.include?(user)) }

  # end

end
