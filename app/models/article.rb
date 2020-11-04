class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories, dependent: :delete_all
  has_attached_file :image,
                    # storage: :cloudinary,
                    # path: ':id/:style/:filename',
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/app/assets/images/missing.png'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  validates :title, presence: true, length: { minimum: 5,
                                              too_long: 'Title can be 5 characters long.' }
  validates :body, presence: true, length: { maximum: 2000,
                                             too_long: '2000 characters in post is the maximum allowed.' }

  def category_list
    categories.collect(&:name).join(', ')
  end

  def category_list=(categories_string)
    category_names = categories_string.split(',').collect { |s| s.strip.downcase }.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
    self.categories = new_or_found_categories
  end

  def self.featured_article
    if Vote.any?
      popular = Vote.group(:article_id).count(:article_id).max_by { |_, x| x }[0]
      Article.find(popular)
    else
      Article.first
    end
  end

  def self.top_category(cat)
    category = Category.find(cat)
    return Article.first unless category.articles.any?

    category.articles.order('created_at DESC').first
  end
end
