class Vote < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :user_id, presence: true, uniqueness: { scope: :article_id }
end
