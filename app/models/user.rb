class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "assets/images/small.png"
  # validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  enum role: {admin: 1, user: 2}
  has_one :profile

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

  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :active_friends, -> { where(friendships: {flag: true}) }, :through => :friendships, :source => :friend
  has_many :passive_friends, -> { where(friendships: {flag: true}) }, :through => :passive_friendships, :source => :user
  has_many :pending_friends, -> { where(friendships: {flag: false}) }, :through => :friendships, :source => :friend
  has_many :requested_friendships, -> { where(friendships: {flag: false}) }, :through => :passive_friendships, :source => :user


    def friends
      active_friends | passive_friends
    end
end

