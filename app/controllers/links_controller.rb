class LinksController < ApplicationController
 
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(links_params)
    if @link.save
      flash[:notice] = "Your link has been saved."
      redirect_to links_path
    else
      render :new
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "Your link has been removed."
    redirect_to links_path
  end

private

  def links_params
    params.require(:link).permit(:description, :url)
  end
end