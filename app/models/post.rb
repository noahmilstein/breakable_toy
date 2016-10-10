class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :date, presence: true
  validates :body, presence: true
  validates :tags, presence: true
end
