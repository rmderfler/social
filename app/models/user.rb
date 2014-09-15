class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email
  validates_presence_of :name

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, :foreign_key => "user_email"

  has_many :messages

  def friends_messages

    messages = []
    self.friendships.map { |friendship| friendship.friend }.each do |user|
      user.messages.each { |message| messages << message } 
    end
    messages.sort_by{|message| message[:created_at]}.reverse
  end
  
end

