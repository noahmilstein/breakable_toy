class Video < ActiveRecord::Base
  after_create { validates_presence_of :user, :post }

  belongs_to :user
  belongs_to :post
  has_many :comments

  validates :title, presence: true
  acts_as_taggable

  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, if: "url.present?"

  def self.search(search)
    videos = Video.tagged_with(search.to_s, :any => true)
    videos
  end
end
