class Comment < ApplicationRecord
  belongs_to :article
  validates :name, presence: true
  validates :body, presence: true
end
