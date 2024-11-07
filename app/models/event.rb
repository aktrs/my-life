class Event < ApplicationRecord

    attachment :image
    belongs_to :user

    validates :age, presence: true, length: { maximum: 2}
    validates :month, presence: true, length: {maximum: 2}
    validates :event, presence: true
    
end
