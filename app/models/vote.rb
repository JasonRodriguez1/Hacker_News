class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  
  validates_uniqueness_of :user_id, scope: :link_id

 # def calculate_score
 #    minutes_since_link = (Time.now - self.created_at.to_time) / 60
 #    percent_of_day = (200 - minutes_since_link) / 200
 #    self.calc_score = 1 * percent_of_day
    
 # end
end
