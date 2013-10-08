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
    least_popular_link = Link.create(:description => "least popular", :url => "www.hulu.com")
    most_popular_link = Link.create(:description => "most poular", :url => "www.youtube.com")
    middle_popular_link = Link.create(:description => "middle popular", :url => "www.facebook.com")  
    # make 3 votes for one link, 2 for another, and 1 for the other
    vote1 = Vote.create(:user_id => user1.id, :link_id => most_popular_link.id)
    vote2 = Vote.create(:user_id => user2.id, :link_id => most_popular_link.id)
    vote3 = Vote.create(:user_id => user3.id, :link_id => most_popular_link.id)
    vote4 = Vote.create(:user_id => user1.id, :link_id => middle_popular_link.id)
    vote5 = Vote.create(:user_id => user2.id, :link_id => middle_popular_link.id)
    vote6 = Vote.create(:user_id => user3.id, :link_id => least_popular_link.id)
    # say that when you call the method you're about to write, they come out sorted in the right order
    Link.sort_by_votes.should eq [most_popular_link,middle_popular_link,least_popular_link]
  end

end