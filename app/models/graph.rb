class Graph < ApplicationRecord
    def self.circla_data(user)
        value = user.graphs
    end

    belongs_to :user

    validates :age, presence: true, length: { maximum: 2 }
    validates :value, presence: true, length: { maximum: 2 }
end
