class User < ApplicationRecord
  has_many :articles
  has_many :votes
  validates :name, presence: true, uniqueness: true, length: { minimum: 4,
                                                               too_short: 'Name can be minimum of 4 characters long.' }
  validates :email, presence: true, uniqueness: true, length: { maximum: 50,
                                                                too_long: 'Email can be maximum 50 characters long.' }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  scope :find_user, ->(user_id) { where('id = ?', user_id) }
end
