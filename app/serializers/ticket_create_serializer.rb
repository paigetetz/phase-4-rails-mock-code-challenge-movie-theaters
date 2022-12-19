class TicketCreateSerializer < ActiveModel::Serializer

  attributes :id, :price, :guest_id, :theater_id
  belongs_to :guest
end
