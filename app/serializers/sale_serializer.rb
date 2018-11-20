class SaleSerializer < ActiveModel::Serializer
  attributes :id, :origin_id, :destination_id, :price
end
