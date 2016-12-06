class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :doi, :title, :journal_id, :vol, :year, :issue, :start_page
  has_one :journal
end
