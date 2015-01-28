class News < ActiveRecord::Base
  validates :title, :body, presence: true
  validates :body, length: { minimum: 25 }
end
