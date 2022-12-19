class Ticket < ApplicationRecord
    belongs_to :guest
    belongs_to :theater

    validates :price, numericality: { greater_than: 1, less_than_or_equal_to: 30 }
end
