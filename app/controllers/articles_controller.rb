class ArticlesController < ApplicationController

  def new
    @article = Article.new
    @article.build_journal
    @journals = Journal.order("name ASC")
  end

  def create
    binding.pry
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
      @author =  User.find(params[:user_id])
      @articles = @author.articles
    else
      @articles = Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:doi, :title, :year, :vol, :issue, :start_page, :journal_attributes => [:id, :name])
  end

end
