class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :title, presence: true

  def mentions
    usernames = self.title.scan(/@(\w+)/).flatten
    User.where(username: usernames)
  end

end
