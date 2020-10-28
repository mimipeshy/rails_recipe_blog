class Article < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :categories
  validates :title, presence: true, length: { maximum: 50,
                                              too_long: 'Title can be maximum 50 characters long.' }
  validates :body, presence: true, length: { maximum: 2000,
                                              too_long: '2000 characters in post is the maximum allowed.' } 
  
end
