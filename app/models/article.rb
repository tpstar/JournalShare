class Article < ApplicationRecord
  has_many :article_users
  has_many :users, :through => :article_users
  has_many :demands
  belongs_to :journal

  scope :recent, -> { order("articles.updated_at DESC") }

  # def journal_name=(name)
  #   if (name != "")
  #     self.journal = Journal.find_or_create_by(name: name)
  #   else
  #     nil
  #   end
  # end
  #
  # def journal_name
  #   self.try(:journal).try(:name)
  # end

  def journal_attributes=(journal_attributes)
    if journal_attributes[:name] != ""
      self.journal = Journal.find_or_create_by(name: journal_attributes[:name])
    else
      self.journal = Journal.find(journal_attributes[:id])
    end
  end

end
