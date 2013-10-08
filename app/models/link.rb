class Link < ActiveRecord::Base
  validates :url, :presence => true
  belongs_to :user
  has_many :votes


  def votes_count
    self.votes.count
  end

  def Link.sort_by_votes
    # Link.all.count.sort { |link1, link2| link2.points <=> link1.points }
    @sorted_links = self.all.sort_by { |link| link.votes.count }
    @sorted_links.reverse
  end
end