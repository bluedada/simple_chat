class Chatroom < ApplicationRecord
	validates :name, presence: true
	has_many :user_chatroomships
	has_many :messages
	has_many :user, :through => :user_chatroomships
end
