require 'spec_helper'

describe Link do 
  it { should belong_to :user }
  # it { validates presence_of => :description }
  # it { validates presence_of => :url }
  # it { validates presence_of => :user_id }
end