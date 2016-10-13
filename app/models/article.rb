class Article < ApplicationRecord
  has_many :article_users
  has_many :users, :through => :article_users
  has_many :demands
  belongs_to :journal

  def journal_name=(name)
    self.journal = Journal.find_or_create_by(name: name)
  end

  def journal_name
  self.try(:journal).try(:name)
end

end
