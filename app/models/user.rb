class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "assets/images/small.png"
  # validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  enum role: {admin: 1, user: 2}
  has_one :profile
  has_many :posts,  dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed ,:through => :relationships,source: :followed
  has_many :inverse_relationships,:class_name=>"Relationship",foreign_key: "followed_id"
  has_many :inverse_relationships, :through => :inverse_relationships,:source => :user
#for freinds
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
end
