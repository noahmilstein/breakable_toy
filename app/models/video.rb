class Video < ActiveRecord::Base
  after_create { validates_presence_of :user, :post }

  belongs_to :user
  belongs_to :post
  has_many :comments

  validates :title, presence: true
  acts_as_taggable
end
