class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email
  

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, :foreign_key => "user_email"

  has_many :messages

  after_create :send_signup_email

  def friends_messages

    messages = []
    self.friendships.map { |friendship| friendship.friend }.each do |user|
      user.messages.each { |message| messages << message } 
    end
    messages.sort_by{|message| message[:created_at]}.reverse
  end

  def send_signup_email
    destination_email = self.email
    gmail = Gmail.connect!('epicodusstudent', '88characters')
    mail = gmail.compose do
      to destination_email
      subject 'Thanks for signing up!'
      body "And have a great day!"
    end
    mail.deliver!
    gmail.logout
  end
  
end

