class Friendship < ActiveRecord::Base

  belongs_to :user

  validates :user, presence: true, uniqueness: {scope: :friend_id}

end