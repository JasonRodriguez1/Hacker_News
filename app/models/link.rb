class Link < ActiveRecord::Base
  validates :url, :presence => true
  belongs_to :user
  has_many :votes
  has_many :comments, :as => :commentable

  def self.sort_by_votes
    sorted_votes = Link.all.sort_by  { |link| link.votes.count }
    sorted_votes.reverse
  end
end
