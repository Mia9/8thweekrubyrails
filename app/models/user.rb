class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :follower_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :follower_users

  has_many :following_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :following_users

  has_many :likes, dependent: :destroy

  def is_following?(followee_id)
    followees.where(id: followee_id).first
  end

  def has_liked?(object)
    likes.where(likeable: object).first
  end
end
