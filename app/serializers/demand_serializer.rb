class DemandSerializer < ActiveModel::Serializer
  attributes :id
  has_one :reader
  has_one :article
  has_one :author
end
