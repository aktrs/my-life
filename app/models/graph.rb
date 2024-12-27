class Graph < ApplicationRecord
    def self.circla_data(user)
        value = user.graphs
    end

    belongs_to :user
    has_one_attached :image

    validates :age, presence: true, length: { maximum: 2 }, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }, format: { with: /\A[0-9]+\z/ }
    validates :value, presence: true, length: { maximum: 3 }, numericality: { greater_than_or_equal_to: -100, less_than_or_equal_to: 100 }, format: { with: /\A[0-9]+\z/ }
end

