class DemandsController < ApplicationController

  def create
    @demand = Demand.new
    @demand.author = User.find(params[:author_id])
    @demand.reader = User.find(params[:reader_id])
    @demand.article = Article.find(params[:article_id])
    if @demand.save
      # send a request to author
      flash[:notice] = "Your request has been sent to the author."
      redirect_to root_path
    else
      flash[:notice] = "We could not complete your request."
      redirect_to root_path
    end
  end

end
