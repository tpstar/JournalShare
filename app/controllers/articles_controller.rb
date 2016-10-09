class ArticlesController < ApplicationController

  def new
    @article = Article.new
    @journals = Journal.order("name ASC")
  end

  def create
    if @article = Article.find_by(doi: params[:article][:doi])
    else
      @article = Article.new(article_params)
    end
    @article.users << current_user unless @article.users.include?(current_user)
    @article.save
    #binding.pry
    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:doi, :title, :year, :vol, :issue, :start_page)
  end

end
