class User < ApplicationRecord
  has_secure_password
  # Validation
  validates_uniqueness_of :username
  # Association
  has_many :movies
end
