class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  belongs_to :commentable, polymorphic: true

end
