class ArticlesController < ApplicationController

  def new
    @article = Article.new
    @article.build_journal
    @journals = Journal.order("name ASC")
  end

  def create
    if params[:article][:doi] == ""
      flash[:alert] = "Please add DOI (Digital object identifier)."
      redirect_to new_article_path
    else
      unless @article = Article.find_by(doi: params[:article][:doi])
        @article = Article.new(article_params)
      end
      @article.users << current_user unless @article.users.include?(current_user)
      @article.save
      # redirect_to @article
      render json: @article, status: 201
    end
  end

  def index
    if params[:user_id]
      @article = Article.new #for the form in the index page
      @article.build_journal #for the form in the index page
      @journals = Journal.order("name ASC") #for the form in the index page

      @author =  User.find(params[:user_id])
      @articles = @author.articles
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @articles.recent }
      end
    else
      @articles = Article.all
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @articles.recent }
      end
    end
  end

  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @article }
    end
  end

  private

  def article_params
    params.require(:article).permit(:doi, :title, :year, :vol, :issue, :start_page, :journal_attributes => [:id, :name])
  end

end
