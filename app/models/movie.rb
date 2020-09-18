class Movie < ApplicationRecord
  belongs_to :user

  validates :url, :title, presence: true
end
