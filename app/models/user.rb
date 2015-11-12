class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	# validates :email, :full_name, :password, :presence => true
	# validates :email, uniqueness: true
	# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	# validates :password, length: { minimum: 6 }
	# validates :password, confirmation: true
end
