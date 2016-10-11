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
    @article.authors << current_user unless @article.authors.include?(current_user)
    @article.save
    #binding.pry
    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
    #@request = current_user.active_requests.build(author_id: @article.users.last.id)
  end

  def article_params
    params.require(:article).permit(:doi, :journal_id, :title, :year, :vol, :issue, :start_page)
  end

end
