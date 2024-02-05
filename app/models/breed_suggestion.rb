class BreedSuggestion < ApplicationRecord
  belongs_to :breed
  belongs_to :QuizResult
end
