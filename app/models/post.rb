class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    
    validate :title_is_clickbait

    def title_is_clickbait
        click_baits = ["Won't Beleive", "Secret", "Top [number]", "Guess"]

        unless click_baits.include?(title)
            errors.add(:title, "It is not clickbaity enough")
        end 
    end
end
