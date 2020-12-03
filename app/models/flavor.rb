class Flavor < ApplicationRecord
    has_many :kombuchas, dependent: :destroy
    has_many :users, through: :kombuchas
    validates :name, presence: true
end
