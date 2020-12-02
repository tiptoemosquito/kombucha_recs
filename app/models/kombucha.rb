class Kombucha < ApplicationRecord
    belongs_to :user
    belongs_to :flavor

    scope :alcohol, -> {where(alcohol: false)}
    accepts_nested_attributes_for :flavor, :reject_if => :all_blank, :allow_destroy => true
    validates :brand_name, presence: true
end
