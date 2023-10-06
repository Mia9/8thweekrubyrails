class Follow < ApplicationRecord
	belongs_to :follower, class_name: 'User'
	belongs_to :followee, class_name: 'User'

	validates :follower_id, uniqueness: {scope: :followee_id}
	#validates has different usage
end
