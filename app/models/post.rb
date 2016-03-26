class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	belongs_to :relationship
	has_one :likeships
	has_many :users
end
