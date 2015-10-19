class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
acts_as_voter
=======
>>>>>>> 35a57fe8bcbbf4e5b671aedcfac150f8c7c10867

  has_many :posts
  has_many :friendships, dependent: :destroy
  has_many :active_friends, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend
  has_many :passive_friends, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user
  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user

  
  
<<<<<<< HEAD
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                                        :default_url => "/images/:style/missing.png",
                                        :url => "/images/:style/:basename.:extension",
                                        :path => ":rails_root/public/images/:style/:basename.:extension"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  has_many :comments, dependent: :destroy
=======
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
                                        :url => "/assets/images/:style/:basename.:extension",
                                        :path => ":rails_root/public/assets/images/:style/:basename.:extension"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  has_many :comments, dependent: :destroy

>>>>>>> 35a57fe8bcbbf4e5b671aedcfac150f8c7c10867
  
  def friends
      active_friends | passive_friends
  end

  def to_s
    username
  end
  
end
