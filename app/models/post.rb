class Post < ActiveRecord::Base
  belongs_to :user
  has_many :videos, dependent: :destroy

  validates :title, presence: true
  validates :date, presence: true
  validates :body, presence: true
  validates :tags, presence: true
end
