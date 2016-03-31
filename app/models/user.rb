class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: {admin: 1, user: 2}
 
  has_one :profile
 
  # picture upload
  mount_uploader :avatar, AvatarUploader

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  has_many :likeships
  has_many :posts, dependent: :destroy
  #for follow/Unfollow
  has_many :relationships
  has_many :followed ,:through => :relationships,source: :followed
  has_many :inverse_relationships,:class_name=>"Relationship",foreign_key: "followed_id"
  has_many :inverse_relationships, :through => :inverse_relationships,:source => :user
  #for freinds
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

end

