class QuizzesController < ApplicationController
  def index
    @questions = [
      { question: "Where do you live ?", answers: { "Big house with garden": 1, "Apartment outside the city": 2, "Apartment inside the city": 3 } },
      { question: "Do you mind shedding ?", answers: { "Yes, I don't want a lot of shedding": 1, "It's not that big of a deal": 2, "No, it's fine by me !": 3 } },
      { question: "How much time do you have for walks every day ?", answers: { "Less than 1 hour": 1, "Between 1 hour and 2 hours": 2, "Have all the time in the world !": 3 } },
      # Add more questions as needed
    ]
  end

  def submit
    score = params[:answers].values.map(&:to_i).sum

    @breed = Breed.where("score >= ? AND score <= ?", score - 3, score + 3).first

    redirect_to breeds_path(breed_id: @breed)
  end
end
