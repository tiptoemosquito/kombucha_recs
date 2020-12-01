class Flavor < ApplicationRecord
    belongs_to :user
    belongs_to :kombucha

    validate :ingrediants, presence: true
    validate :alcoholic, presence: true
end
