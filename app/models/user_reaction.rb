class UserReaction < ApplicationRecord
	belongs_to :user
  belongs_to :reactable, polymorphic: true

  

   # Validations
  validates :user_id, presence: true
  validates :reactable_type, presence: true
  validates :reactable_id, presence: true

end
