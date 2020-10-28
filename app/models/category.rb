class Category < ApplicationRecord
  has_many :articles, through: :recipe_categories, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
end
