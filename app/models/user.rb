class User < ActiveRecord::Base
	has_secure_password
	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy
	

	validates :email, uniqueness: true
	validates :name, :email, :password, :password_confirmation, presence: true
	validates :password, length: { in: 6..20 }
	validates :password, confirmation: true	
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
