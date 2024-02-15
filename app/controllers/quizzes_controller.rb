class QuizzesController < ApplicationController
  def index
    @user = current_user
    @questions = [
      { question: "Where do you live ?", answers: { "Big house with garden": "Big house with garden", "Apartment outside the city": "Apartment outside the city", "Apartment inside the city": "Apartment inside the city" } },
      { question: "Do you mind shedding ?", answers: { "Yes, I don't want a lot of shedding": "Yes, I don't want a lot of shedding", "Shedding is not that big of a deal": "Shedding is not that big of a deal", "No, shedding is fine by me !": "No, shedding is fine by me !" } },
      { question: "How much time do you have for walks every day ?", answers: { "Less than 1 hour": "Less than 1 hour", "Between 1 hour and 2 hours": "Between 1 hour and 2 hours", "Have all the time in the world !": "Have all the time in the world !" } },
      { question: "Do you have children ?", answers: { "Yes": "Yes", "No": "No"} },
      { question: "Do you want to spend a lot of money on your friend ?", answers: { "Yes": "Yes", "Maybe": "Maybe", "No": "No" } },
      # Add more questions as needed
    ]
  end

  def submit
    openai = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY'])
    answers = params[:answers]

    prompt = "List me 6 dog breeds are the best fit for me regarding these precisions:\n"
    prompt += "- I have a #{answers["0"]}\n"
    prompt += "- I #{answers["1"]}\n"
    prompt += "- I have #{answers["2"]}\n"
    prompt += "- Do I have children ? #{answers["3"]}\n"
    prompt += "- Do I have money to spend on my dog ? #{answers["4"]}\n"
    prompt += "Please give me just the names, no text before, no numbers, just the names, remove the numbers I don't want it to be a list and put the breeds always in a different order and for godsake no numbers !!!!!!!!"
    puts prompt
    response = openai.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt}],
        temperature: 0.7,
      }
    )
    breed_names = response.dig("choices", 0, "message", "content")
    @breed_names = breed_names.split(',')
    puts @breed_names.inspect

    @user = current_user
    # for each tag

    redirect_to breeds_path(breeds_names: @breed_names)
  end
end
