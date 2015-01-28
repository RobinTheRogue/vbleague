class Newsletter < ActiveRecord::Base
  validates :title, :body, :published_on, presence: true
  validates :body, length: { minimum: 25 }
end
