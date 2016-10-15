module DemandsHelper
  def requested_reader
    reader = User.find(@demand.reader_id)
  end

  def requested_article
    article = Article.find(@demand.article_id)
  end
end
