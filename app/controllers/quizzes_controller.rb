class QuizzesController < ApplicationController
  def index
    @user = current_user
    @questions = [
      { question: "Where do you live ?", answers: { "Big house with garden": 1, "Apartment outside the city": 2, "Apartment inside the city": 3 } },
      { question: "Do you mind shedding ?", answers: { "Yes, I don't want a lot of shedding": 4, "It's not that big of a deal": 5, "No, it's fine by me !": 6 } },
      { question: "How much time do you have for walks every day ?", answers: { "Less than 1 hour": 7, "Between 1 hour and 2 hours": 8, "Have all the time in the world !": 9 } },
      # Add more questions as needed
    ]
  end

  def submit
    score = params[:answers].values.map(&:to_i).sum

    # Find breeds with the exact same score as the user's quiz score
    breeds = Breed.where(score: (score - 5)..(score + 5))

    @breeds_array = breeds.to_a

    current_user.breeds = @breeds_array
    current_user.save

    redirect_to breeds_path(breed_scores: @breeds_array.map(&:score))
  end
end
