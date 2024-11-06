class Event < ApplicationRecord

    attachment :image
    belongs_to :user

    validates :age, presence: true
    validates :month, presence: true
    validates :event, presence: true
    
end
