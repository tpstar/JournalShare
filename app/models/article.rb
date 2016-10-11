class Article < ApplicationRecord
  has_many :article_authors
  has_many :authors, :through => :article_authors, class_name: 'User'
  has_many :demands
  belongs_to :journal

end
