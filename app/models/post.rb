class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	belongs_to :relationship
	has_one :likeship
	has_many :users
end
