class Link < ActiveRecord::Base
  validates :url, :presence => true
  belongs_to :user
  has_many :votes


  def votes_count
    self.votes.count
  end

  def self.sort_by_points
    votes.points.sort |link1, link2| link1.points <=> link2.points
  end
end