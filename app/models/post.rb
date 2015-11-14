class Post < ActiveRecord::Base
	belongs_to :city, dependent: :destroy
	belongs_to :user, dependent: :destroy
	validates :title, presence: true, length: { in: 1..200 }
	validates :content, presence: true
	# validates :title, :content, presence: => true
end
