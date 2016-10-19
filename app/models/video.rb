class Video < ActiveRecord::Base
  after_create { validates_presence_of :user, :post }

  belongs_to :user
  belongs_to :post
  has_many :comments

  validates :title, presence: true
  # url validation conflicts with FactoryGirl
  # validates :url, presence: true, uniqueness: true

  acts_as_taggable
  # attr_accessor :tag_list
end
