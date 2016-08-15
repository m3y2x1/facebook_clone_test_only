class Like < ActiveRecord::Base

	belongs_to :status
	belongs_to :user
	validates :user_id, :status_id, presence: true
end
