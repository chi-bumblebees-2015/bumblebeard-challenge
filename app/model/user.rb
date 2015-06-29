require_relative '../../db/config'

class User < ActiveRecord::Base
  has_many :groups
  has_many :contacts, through: :contacting, class_name: :user
  has_many :sent_messages, through: :messaging, class_name: :message
  has_many :
end
