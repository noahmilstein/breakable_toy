class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  validates :body, presence: true
  after_create { validates_presence_of :user, :video }
end
