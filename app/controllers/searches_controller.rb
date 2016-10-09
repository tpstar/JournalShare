class SearchesController < ApplicationController

  def create
    if @article = Article.find_by(doi: params[:doi])
      redirect_to @article
    else
      flash[:notice] = "Sorry, the article you are looking for has not been posted in our database"
      redirect_to root_path
    end
  end

end
