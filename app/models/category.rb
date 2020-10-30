class Category < ApplicationRecord
  has_many :recipe_categories
  has_many :articles, through: :recipe_categories, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  scope :category_articles, -> { order('priority DESC') }

  def self.most_recent(category)
    category.articles.order('created_at DESC').limit(4)
  end

  def self.category_articles(category)
    category.articles.includes(:user, :categories).order('created_at DESC')
  end
end
