class Kombucha < ApplicationRecord

    belongs_to :user
    belongs_to :flavor

    scope :low_calorie, -> { where(calories: 60) }

    validate :brand, presence: true
    validate :size, presence: true
end
