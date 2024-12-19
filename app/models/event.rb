class Event < ApplicationRecord

    attachment :image
    belongs_to :user

    validates :age, presence: true, length: { maximum: 2}, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }, format: { with: /\A[0-9]+\z/ }
    validates :month, presence: true, length: {maximum: 2}, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }, format: { with: /\A[0-9]+\z/ }
    validates :event, presence: true, length: {maximum: 10}
    validates_length_of :event_detail, maximum: 50, allow_nil: true
end
