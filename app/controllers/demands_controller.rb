class DemandsController < ApplicationController

  def create
    @demand = Demand.new
    @demand.author = User.find(params[:author_id])
    @demand.reader = User.find(params[:reader_id])
    @demand.article = Article.find(params[:article_id])
    if @demand.save
      # send a request to author
      flash[:message] = "Your request has been sent to the author."
      @article = @demand.article
      respond_to do |format|
        format.html { render 'articles/show', article: @article }
        format.json { render json: {"notification": "Your request has been sent to the author."} }
      end

    else
      flash[:notice] = "We could not complete your request."
      redirect_to root_path
    end
  end

  def show
    @demand = Demand.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @demand }
    end
  end

  def destroy
    @demand = Demand.find(params[:id])
    @demand.destroy
    flash[:notice] = "The request has been removed."
    redirect_to root_path
  end

end
