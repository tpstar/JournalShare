class DemandsController < ApplicationController

  def create
    @demand = Demand.new
    @demand.author = User.find(params[:author_id])
    @demand.reader = User.find(params[:reader_id])
    @demand.article = Article.find(params[:article_id])
    if @demand.save
      # send a request to author
      # flash[:notice] = "Your request has been sent to the author."
      # redirect_to root_path
      # render @demand.article
      render layout: false
    else
      flash[:notice] = "We could not complete your request."
      redirect_to root_path
    end
  end

  def show
    @demand = Demand.find(params[:id])
  end

  def destroy
    @demand = Demand.find(params[:id])
    @demand.destroy
    flash[:notice] = "The request has been removed."
    redirect_to root_path
  end

end
