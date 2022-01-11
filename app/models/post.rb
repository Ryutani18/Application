class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    has_many :likes, dependent: :destroy
    belongs_to :user
    validates :content, {presence: true, length: {maximum: 1000}}
end
