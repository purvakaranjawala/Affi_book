class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User", foreign_key: "friend_id" , dependent: :destroy
  scope :frndrequest, lambda{ |user| where(:friend_id => user.id,flag: false)}
  scope :friend_count,lambda{|user| where(:friend_id => user.id,flag: true) }
end

