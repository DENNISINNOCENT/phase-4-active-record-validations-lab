class Post < ApplicationRecord

    Title_should_contain= [/Won't Believe/i,  /Secret/i, /Top/i, /Guess/i ]
    validates :title, presence:  true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate  :title_is_clickbait

    def title_is_clickbait
        if Title_should_contain.none? { |word| word.match title}
            errors.add(:title, "Title not clickbaity enough")
        end

    end

end
