class Event < ApplicationRecord

    attachment :image
    belongs_to :user

    validate :age_must_be_half_width_digits
    validate :month_must_be_half_width_digits
    validates :age, presence: true, length: { maximum: 2}
    validates :month, presence: true, length: {maximum: 2}
    validates :event, presence: true, length: {maximum: 10}
    validates_length_of :event_detail, maximum: 50, allow_nil: true
    
    private
    def age_must_be_half_width_digits
        unless age =~ /\A\d+\z/ 
            errors.add(:age, "には半角数字のみを入力してください")
        end
    end

    def month_must_be_half_width_digits
        unless month =~ /\A\d+\z/
          errors.add(:month, "には半角数字のみを入力してください")
        end
    end
end
