class User < ApplicationRecord
  has_many :articles
  has_many :votes
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  scope :find_user, ->(user_id) { where('id = ?', user_id) }
end
