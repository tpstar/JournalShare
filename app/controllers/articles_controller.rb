class ArticlesController < ApplicationController

  def new
    @article = Article.new
    @journals = Journal.order("name ASC")
  end

  def create
    # binding.pry
    if params[:article][:doi] == ""
      flash[:alert] = "Please add DOI (Digital object identifier)."
      redirect_to new_article_path
    else
      unless @article = Article.find_by(doi: params[:article][:doi])
        @article = Article.new(article_params)
      end
      @article.users << current_user unless @article.users.include?(current_user)
      @article.save
      redirect_to @article
    end
  end

  def index
    if params[:user_id]
      @articles = User.find(params[:user_id]).articles
    else
      @articles = Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
    #@request = current_user.active_requests.build(author_id: @article.users.last.id)
  end

  def article_params
    params.require(:article).permit(:doi, :journal_id, :title, :year, :vol, :issue, :start_page, :journal_name)
  end

end
