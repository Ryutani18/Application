class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :relationships, foreign_key:'followed_id', dependent: :destroy
    has_many :relationships, foreign_key:'follower_id', dependent: :destroy
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true, format: {with: /@.*\./}}
    validates :password, {presence: true}
end