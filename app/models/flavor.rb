class Flavor < ApplicationRecord

    has_many :kombuchas
    has_many :users, through: :kombuchas

    validates :name, presence: true
    validates :ingredients, presence: true
    validates :alcoholic, presence: true
end
