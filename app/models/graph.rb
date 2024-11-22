class Graph < ApplicationRecord
    def self.circla_data(user)
        value = user.graphs
    end

    belongs_to :user
    has_one_attached :image

    validates :age, presence: true, length: { maximum: 2 }
    validates :value, presence: true, length: { maximum: 4 }
    validates :image, presence: true
end

