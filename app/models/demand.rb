class Demand < ApplicationRecord
  belongs_to :reader, :class_name => 'User', :foreign_key => :reader_id
  belongs_to :author, :class_name => 'User', :foreign_key => :author_id
  belongs_to :article

end
