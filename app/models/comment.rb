class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  belongs_to :commentable, polymorphic: true

  def route_to_comment
  	if self.commentable.is_a?(Link)
  	  self.commentable
    else
  	  self.commentable.route_to_comment
    end
  end

end
