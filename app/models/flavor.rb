class Flavor < ApplicationRecord

    has_many :kombuchas
    has_many :users, through: :kombuchas

    validates :name, presence: true
    validate :ingredients, presence: true
    validate :alcoholic, presence: true
end
