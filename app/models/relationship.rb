class Relationship < ApplicationRecord
  belongs_to :user, foreign_key:'followed_id'
  belongs_to :user, foreign_key:'follower_id'
  validates :followed_id, {presence: true}
  validates :follower_id, {presence: true}
end
