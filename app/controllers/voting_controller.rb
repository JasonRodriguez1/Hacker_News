class VotesController < ApplicationController
  
  def index
    @votes = Votes.all
  end

  def create
    @vote = Vote.new(voter_params)
    if @vote.save
      redirect_to links_path, notice: "Thanks for voting!"
    end
  end

private

  def voter_params
    params.require(:vote).permit(:user_id, :link_id)
  end

end  