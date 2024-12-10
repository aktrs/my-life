class Event < ApplicationRecord

    attachment :image
    belongs_to :user

    validates :age, presence: true, length: { maximum: 2}
    validates :month, presence: true, length: {maximum: 2}
    validates :event, presence: true, length: {maximum: 10}
    validates_length_of :event_detail, maximum: 50, allow_nil: true
    
end
