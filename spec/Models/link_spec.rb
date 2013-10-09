require 'spec_helper'

describe Link do 
  it { should belong_to :user }
  it { should have_many :votes }
  it { should have_many :comments }

  it "sorts links based on vote count" do 
    user1 = User.create(:name => "test1", :email => "a@a.com", :user_name => "zeratul", :password => "1234", :password_confirmation => "1234")
    user2 = User.create(:name => "test2", :email => "s@s.com", :user_name => "tassadar", :password => "5678", :password_confirmation => "5678")
    user3 = User.create(:name => "test3", :email => "d@d.com", :user_name => "artanis", :password => "8910", :password_confirmation => "8910")  
    #make links
    link1 = user1.links.create(:url => "http://www.google1.com", :description => "pants1")
    link2 = user2.links.create(:url => "http://www.google2.com", :description => "pants2")
    link3 = user1.links.create(:url => "http://www.google3.com", :description => "pants3")
    #vote
    user1.votes.create(:link_id => link2.id)
    user2.votes.create(:link_id => link2.id)
    user3.votes.create(:link_id => link2.id)

    user1.votes.create(:link_id => link1.id)
    user2.votes.create(:link_id => link1.id)

    user1.votes.create(:link_id => link3.id)
   
    Link.sort_by_votes.should eq [link2, link1, link3]
  end

end
