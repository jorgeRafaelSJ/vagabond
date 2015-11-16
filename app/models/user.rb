class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_secure_password
	validates :email, uniqueness: true
	has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "http://i.imgur.com/cepxUEY.jpg"
	has_attached_file :avatarthumb, styles: { thumb: "100x100>" }, default_url: "http://i.imgur.com/wBmYDiQ.jpg"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
	do_not_validate_attachment_file_type :avatar

	validates :city, presence: true

	# validates :email, :full_name, :password_digest, :presence => true

	# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	# validates :password, length: { minimum: 6 }
	# validates :password, confirmation: true
end
