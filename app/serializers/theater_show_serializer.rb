class TheaterShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :capacity
  has_many :guests
end
