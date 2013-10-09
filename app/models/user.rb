class User < ActiveRecord::Base
  has_secure_password
  has_many :links
  has_many :votes
  has_many :comments
  
  validates_uniqueness_of :email

end
