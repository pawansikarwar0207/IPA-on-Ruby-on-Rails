class UserReaction < ApplicationRecord
	belongs_to :reactable, polymorphic: true
end
