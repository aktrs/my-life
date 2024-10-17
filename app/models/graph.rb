class Graph < ApplicationRecord
    def self.circla_data(user)
        value = user.graphs
    end

    belongs_to :user
end
