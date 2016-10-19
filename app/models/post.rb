class Post < ActiveRecord::Base
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :comments, through: :video

  validates :title, presence: true
  validates :date, presence: true
  validates :body, presence: true

  after_create { validates_presence_of :user }
end
