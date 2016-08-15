class Status < ActiveRecord::Base
	belongs_to :user
	has_many :likes, dependent: :destroy
	
	default_scope -> {order("created_at DESC")}
	validates :title, presence: true
	validates_length_of :title, :minimum => 8, :message => "title is too short" 
	validates :content, presence: true 
	validates_length_of :content, :minimum => 10, :message => "content is too short"
end
