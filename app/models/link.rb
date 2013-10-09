class Link < ActiveRecord::Base
  validates :url, :presence => true
  belongs_to :user
  has_many :votes


  def self.sort_by_votes
    all.sort { |link_a, link_b| link_b.calculate_score <=> link_a.calculate_score }
  end

  def calculate_score
    minutes_since_link = (Time.now - self.created_at.to_time) / 60
    percent_of_day = (200 - minutes_since_link) / 200
    self.votes.count * percent_of_day
  end
end