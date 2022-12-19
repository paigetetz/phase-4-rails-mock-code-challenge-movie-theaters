class TicketSerializer < ActiveModel::Serializer
  attributes :id, :price, :guest_id, :theater_id
end
