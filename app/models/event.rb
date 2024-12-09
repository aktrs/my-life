class Event < ApplicationRecord

    attachment :image
    belongs_to :user

    validates :age, presence: true, length: { maximum: 2}
    validates :month, presence: true, length: {maximum: 2}
    validates :event, presence: true
    validates :event_detail, presence: true, length: {maximum:30}
    
end
