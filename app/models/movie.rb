class Movie < ApplicationRecord
  # Association
  belongs_to :user
  # Validation
  validates :url, :title, presence: true
  # Callbacks
  before_save :embed_url

  def embed_url
    if self.url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      self.url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    self.url = "http://www.youtube.com/embed/#{ youtube_id }"
  end
end
