class Question < ApplicationRecord

	validates :title, presence:true, uniqueness:true
	validates :keywords, presence: true
	validates :answer, presence: true

	# showing the none premium questions
	scope :is_premium, -> { where(is_premium: false) }

	has_many :likes
	has_many :users, through: :likes

	has_rich_text :content

	# sorting the data by likes
	def self.most_liked
		left_joins(:likes).group(:id).order('count(likes.id) DESC')
	end


	def self.ransackable_attributes(auth_object = nil)
		["created_at", "id", "is_premium", "keywords", "title","most_liked", "updated_at"]
	end
	
end
