class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  validates :role, inclusion: { in: %w[reader writer] }
end
