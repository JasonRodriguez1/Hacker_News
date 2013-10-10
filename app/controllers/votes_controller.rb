class VotesController < ApplicationController
  
  def index
    @votes = Votes.all
  end

  def create
    @vote = current_user.votes.new(voter_params)
    if @vote.save
      redirect_to links_path, notice: "Thanks for voting!"
    else
      redirect_to links_path, notice: "Sorry, you can only vote on a link once."  
    end
  end


private

  def voter_params
    params.require(:vote).permit(:link_id)
  end

end 
 