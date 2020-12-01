class Kombucha < ApplicationRecord
    belongs_to :user
    has_many :flavors
end
