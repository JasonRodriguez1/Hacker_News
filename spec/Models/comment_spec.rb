require 'spec_helper'

describe Comment do
  it { should belong_to :commentable }
  it { should have_many :comments }
  # it { should have_many :votes }
end
