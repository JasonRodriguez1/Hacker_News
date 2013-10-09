class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  belongs_to :commentable, polymorphic: true

  # def post
  #   if self.commentable_type == "Post"
  #     self.commentable
  #   else
  #     self.commentable.post
  #   end
  # end
end
