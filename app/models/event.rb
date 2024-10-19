class Event < ApplicationRecord

    attachment :image

    validates :age, presence: true
    validates :month, presence: true
    validates :event, presence: true
    
end
