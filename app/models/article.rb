class Article < ApplicationRecord
  has_many :article_authors
  has_many :authors, :through => :article_authors, class_name: 'User'
  has_many :demands
  belongs_to :journal

  def journal_name=(name)
    self.journal = Journal.find_or_create_by(name: name)
  end

  def journal_name
  self.try(:journal).try(:name)
end

end
