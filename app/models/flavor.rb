class Flavor < ApplicationRecord
    belongs_to :user
    belongs_to :kombucha
end
