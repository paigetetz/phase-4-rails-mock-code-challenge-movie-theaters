class Guest < ApplicationRecord
    has_many :tickets
    has_many :theaters, through: :tickets

    validates :name, presence: true
end
