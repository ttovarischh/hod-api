class Player < ApplicationRecord
    belongs_to :game
    has_and_belongs_to_many :effects
end
