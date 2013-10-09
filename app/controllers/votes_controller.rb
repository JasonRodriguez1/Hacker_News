class VotesController < ApplicationController
  
  def index
    @votes = Votes.all
  end

  # def new
  #   @vote = Vote.new
  # end

  def create
    @vote = current_user.votes.new(voter_params)
    if @vote.save
      redirect_to links_path, notice: "Thanks for voting!"
    else
      redirect_to links_path, notice: "Sorry, you can only vote on a link once."  
    end
  end

#   def vote_up
#   check = Vote.find(:first, :conditions => ["user_id = ? AND item_id = ?", session[:user_id], params[:id]])
#   link = link.find(params[:id])
#   if check.nil?
#     link_vote = Vote.new
#     link_vote.link_id = params[:id]
#     link_vote.user_id = session[:user_id]
#     link_vote.value = true
#     link_vote.save
#     link.total_value += 1
#     link.save
#     render :text => link.total_value
#     elsif check.value == false
#     check.value = true
#     check.save
#     link.total_value += 2
#     link.save
#     render :text => link.total_value
#     else
#     render :text => "You have already voted up for this link."
#     end
# end

private

  def voter_params
    params.require(:vote).permit(:link_id)
  end

end 
 