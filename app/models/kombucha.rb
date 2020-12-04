class Kombucha < ApplicationRecord
    belongs_to :user
    belongs_to :flavor
    scope :alcohol, -> { where(alcohol: true) }
    accepts_nested_attributes_for :flavor, :reject_if => :all_blank, :allow_destroy => true
    validates :brand, presence: true
    validates :flavor, presence: true
    validates :ounces, presence: true
end
