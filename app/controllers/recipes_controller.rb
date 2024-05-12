class RecipesController < ApplicationController
  def new; end

  def create
    cuisine_type = params[:cuisine_type]
    dish_type = params[:dish_type]
    ingredients = [params[:ingredients1], params[:ingredients2], params[:ingredients3]]
    number = params[:number]
    additional_ingredient_suggestions = params[:additional_ingredient_suggestions]
    allergy_restrictions = params[:allergy_restrictions]
    cooking_time = params[:cooking_time]

    headers = {
      'Authorization' => "Bearer #{ENV.fetch('OPENAI_API_KEY', nil)}",
      'Content-Type' => 'application/json'
    }

    body = {
      model: 'gpt-3.5-turbo',
      messages: [
        {
          role: 'system',
          content: 'You are a professional chef using a household microwave at 500W or 600W. Create one dish per generation, assuming basic kitchen tools are available.'
        },
        {
          role: 'user',
          content: "Generate a recipe based on the following details:
          Cuisine type: #{cuisine_type},
          Dish type: #{dish_type},
          Ingredients: #{ingredients.join(', ')},
          Number of servings: #{number},
          Additional ingredients allowed: #{additional_ingredient_suggestions},
          Allergies: #{allergy_restrictions},
          Maximum cooking time: #{cooking_time} minutes,
          Output should include:
          Dish name: A concise, imaginative name.
          Cooking time: In minutes, not exceeding #{cooking_time} minutes.
          Ingredients: No more than 7, format:-ingredient_name:quantity
          Cooking steps: Use a 500W or 600W household microwave for all steps. Describe in 3 concise steps, all in Japanese within 300 tokens."
        }
      ]
    }

    response = Faraday.post('https://api.openai.com/v1/chat/completions', body.to_json, headers)

    Rails.logger.info "API Response: #{response.body}"
  end
end
