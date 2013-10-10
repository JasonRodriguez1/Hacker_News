class LinksController < ApplicationController
  before_filter :authorize, only: [:new, :create, :destroy]
 
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
      
    else
      render :new
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "Your link has been removed."
    redirect_to root_path
  end

  def show
    @link = Link.find(params[:id])
  end

private

  def links_params
    params.require(:link).permit(:description, :url)
  end
end
