class Article < ApplicationRecord
  has_many :article_users
  has_many :users, :through => :article_users
  belongs_to :journal

end
