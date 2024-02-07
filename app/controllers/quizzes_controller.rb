class QuizzesController < ApplicationController
  def index
    @questions = [
      { question: "Question 1", answers: { a: 1, b: 2, c: 3 } },
      { question: "Question 2", answers: { a: 1, b: 2, c: 3 } },
      # Add more questions as needed
    ]
  end

  def submit
    # Calculate score based on selected answers
    score = params[:answers].values.map(&:to_i).sum

    # Find item in the database with a similar score (or within 3)
    @breed = Breed.where("score >= ? AND score <= ?", score - 3, score + 3).first

    redirect_to breeds_path(breed_id: @breed.id)
  end
end
