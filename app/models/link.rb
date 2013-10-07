class Link < ActiveRecord::Base
  validates :url, :presence => true
  belongs_to :user
  belongs_to :vote
end