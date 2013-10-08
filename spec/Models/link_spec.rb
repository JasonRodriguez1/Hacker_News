require 'spec_helper'

describe Link do 
  it { should belong_to :user }
  it { should have_many :votes }
  it "counts votes based on link_id matches in the vote table with user_id matches in the link table" do
    link = Link.create(:description => "whatever", :url => "www.hulu.com")
    user1 = User.create(:name => "test1", :email => "s@s.com", :user_name => "zeratul", :password => 1234, :password_confirmation => 1234)
    user2 = User.create(:name => "test2", :email => "d@d.com", :user_name => "tassadar", :password => 4321, :password_confirmation => 4321)
    # create a vote for the link from the first user
    vote = Vote.create(:user_id => user1.id, :link_id => link.id)
    # create a vote for the link from the second user
    vote = Vote.create(:user_id => user2.id, :link_id => link.id)
    # say that the link's vote count should be 2
    link.votes_count.should eq 2
  end

  it "sorts links based on amount of votes" do 
    user1 = User.create(:name => "test1", :email => "a@a.com", :user_name => "zeratul", :password => 1234, :password_confirmation => 1234)
    user2 = User.create(:name => "test2", :email => "s@s.com", :user_name => "tassadar", :password => 5678, :password_confirmation => 4321)
    user3 = User.create(:name => "test3", :email => "d@d.com", :user_name => "artanis", :password => 8910, :password_confirmation => 5678)  
    # make 3 links
    link1 = Link.create(:description => "whatever", :url => "www.hulu.com")
    link2 = Link.create(:description => "whatevz", :url => "www.youtube.com")
    link3 = Link.create(:description => "nahkid", :url => "www.facebook.com")  
    # make 3 votes for one link, 2 for another, and 1 for the other
    vote = Vote.create(:user_id => user1.id, :link_id => link2.id)
    vote = Vote.create(:user_id => user2.id, :link_id => link2.id)
    vote = Vote.create(:user_id => user3.id, :link_id => link2.id)
    vote = Vote.create(:user_id => user1.id, :link_id => link3.id)
    vote = Vote.create(:user_id => user2.id, :link_id => link3.id)
    vote = Vote.create(:user_id => user3.id, :link_id => link1.id)
    # say that when you call the method you're about to write, they come out sorted in the right order
    self.sort_by_points.should eq link2,link3,link1
  end

end