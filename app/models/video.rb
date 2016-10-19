class Video < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_many :comments
  validates :title, presence: true
  after_create { validates_presence_of :user, :post }
  # url validation conflicts with FactoryGirl
  # validates :url, presence: true, uniqueness: true
end
