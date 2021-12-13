class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end