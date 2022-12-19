class Theater < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :guests, through: :tickets

    validates :capacity, numericality: { greater_than_or_equal_to: 10 ,less_than_or_equal_to: 200 } 
end
