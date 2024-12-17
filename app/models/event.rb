class Event < ApplicationRecord

    attachment :image
    belongs_to :user

    validate :age_cannot_contain_full_width_characters_and_be_a_number
    validate :month_cannot_contain_full_width_characters_and_be_a_number
    validates :age, presence: true, length: { maximum: 2}
    validates :month, presence: true, length: {maximum: 2}
    validates :event, presence: true, length: {maximum: 10}
    validates_length_of :event_detail, maximum: 50, allow_nil: true
    
    private
    def age_cannot_contain_full_width_characters_and_be_a_number
        if age.to_i.to_s != age
            errors.add(:age, "には全角文字を含めないでください")
          end
    end

    def month_cannot_contain_full_width_characters_and_be_a_number
        if month.to_i.to_s != month
          errors.add(:month, "には全角文字を含めないでください")
        end
    end
end
