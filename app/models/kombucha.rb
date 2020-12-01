class Kombucha < ApplicationRecord
    belongs_to :user
    has_many :flavors

    validate :brand, presence: true
    validate :size, presence: true
end
