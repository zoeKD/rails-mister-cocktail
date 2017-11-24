class Review < ApplicationRecord
  validates :content, :rating, :cocktail, presence: true
  validates :rating, inclusion: { in: (0..5) }
  belongs_to :cocktail
end
