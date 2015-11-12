class Post < ActiveRecord::Base
	belongs_to :city dependent: :destroy
	belongs_to :user dependent: :destroy

	validates :title, :content, presence: => true
end
