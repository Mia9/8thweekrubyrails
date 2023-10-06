class Post < ApplicationRecord
	has_many_attached :photos
	has_many :comments, dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy
	belongs_to :user

	def liked?(user)
		!!self.likes.find{|like| like.user_id == user.id}	
	end
		
end
