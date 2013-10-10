class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  
  validates_uniqueness_of :user_id, scope: :link_id

end
