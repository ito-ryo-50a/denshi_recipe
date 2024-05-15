いつもお世話になっております。
下記、ご確認いただけますでしょうか。

お手数ですが、よろしくお願いいたします。

## 解決したいこと
現在ポートフォリオの作成を行っています。
オートコンプリートを実装中、フォームからコントローラーに値が渡らずに困っています。


## 試したこと
フォームの記述を`label for="ingredients_input1"`のようにidが一意になるように設定しコントローラーの記述も変更しました。
コントローラーの記述を以下のように変更しました。
```
const index = this.inputTargets.indexOf(input);
const suggestions = this.suggestionsTargets[index];
```
類似のパターンをいくつか試したのですが、そうするとJavaScript自体が読み込まれない状態になったため、
現在は読み込みがされている状態に戻しております。


### ポートフォリオで使用している技術(一部)
```
Rails:7.1.3.2
Ruby:3.3.0
JavaScriptのフレームワーク:stimulus
```


### `ingredients_controller.js`
```
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "suggestions"]
  connect() {
    console.log("ingredients_controller.jsは接続できています!!!");
  }
  update() {
    const input = this.inputTarget.value;
    if (input.length > 0) {
      console.log("input:", input);
      fetch(`/ingredients/search?query=${input}`)
        .then(response => response.json())
        .then(data => {
          this.suggestionsTarget.innerHTML = '';
          data.forEach(item => {
            const div = document.createElement('div');
            div.textContent = item;
            div.className = "p-2 hover:bg-gray-200 cursor-pointer hover:text-blue-500 mx-1 my-1 rounded-md";
            div.addEventListener('click', () => {
              this.inputTarget.value = div.textContent;
              this.suggestionsTarget.innerHTML = '';
            });
            this.suggestionsTarget.appendChild(div);
            console.log("item:", item);
          });
        })
        .catch(error => console.error('Error:', error));
    } else {
      this.suggestionsTarget.innerHTML = '';
    }
  }
}

```


### `recipes_controller.rb`
```
class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :require_login, only: %i[new create edit update destroy]
  skip_before_action :require_login, only: %i[index show]

  def index
    @recipes = Recipe.all
  end

  def show; end

  def new; end

  def create
    # ユーザーの入力値をフォームから取得
    cuisine_type = params[:cuisine_type]
    dish_type = params[:dish_type]
    ingredients = [params[:ingredients1], params[:ingredients2], params[:ingredients3]]
    number = params[:number]
    additional_ingredient_suggestions = params[:additional_ingredient_suggestions]
    allergy_restrictions = params[:allergy_restrictions]
    cooking_time = params[:cooking_time]

    Rails.logger.info("cuisine_type: #{cuisine_type}")
    Rails.logger.info("dish_type: #{dish_type}")
    Rails.logger.info("ingredients: #{ingredients}")
    Rails.logger.info("number: #{number}")
    Rails.logger.info("additional_ingredient_suggestions: #{additional_ingredient_suggestions}")
    Rails.logger.info("allergy_restrictions: #{allergy_restrictions}")
    Rails.logger.info("cooking_time: #{cooking_time}")

    # OpenAI APIへリクエストを送信する
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

    # レスポンスデータのパースを行う
    response_data = JSON.parse(response.body).dig('choices', 0, 'message', 'content')

    # レシピの作成処理の箇所
    @recipe = Recipe.new(
      user_id: current_user.id,
      name: response_data.split('Dish name: ')[1].split('Cooking time:')[0].strip,
      cooking_time: response_data.split('Cooking time: ')[1].split('Ingredients:')[0].strip.to_i,
      cuisine_type: cuisine_type,
      dish_type: dish_type,
      number: number
    )
    # TODO: エラーハンドリング追加時にsaveの条件見直し（save可能であれば、残りのレスポンスはまとめてどこかのレコードに入れてユーザーに表示できるよう検討）
    if @recipe.save
      # 食材と分量を保存
      ingredients_text = response_data.split('Ingredients:')[1].split('Cooking steps:')[0].strip
      ingredients = ingredients_text.split("\n").map { |line| line.strip.sub(/^- /, '') }
      ingredients.each_with_index do |ingredient, _index|
        ingredient_name, quantity = ingredient.split(':').map(&:strip)
        @recipe.recipe_ingredients.create(ingredient_name: ingredient_name, quantity: quantity)
      end

      # 調理手順を保存
      steps_text = response_data.split('Cooking steps:')[1].strip
      steps = steps_text.split("\n")
      steps.each_with_index do |step, index|
        @recipe.recipe_procedures.create(order: index + 1, procedure: step)
      end

      redirect_to recipe_path(@recipe), notice: 'レシピを作成しました。'
    else
      flash.now[:alert] = 'レシピの作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update!(recipe_params)
    redirect_to recipe_path(recipe), notice: 'レシピを更新しました。'
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: 'レシピを削除しました。', status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :cuisine_type, :dish_type, :number,
                                   recipe_ingredients_attributes: %i[id ingredient_name quantity _destroy],
                                   recipe_procedures_attributes: %i[id order procedure _destroy])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end

```


### `new.html.slim`

```
  h1.text-center.text-2xl.font-bold.my-10 レシピを生成する
  .card.flex.flex-col.justify-center.items-center.bg-white.shadow-md.rounded-lg.mx-5.my-10
    = form_with model: @recipe, url: recipes_path, local: true, class: "space-y-4" do |f|
      .form-group
        = f.label :cuisine_type, '料理の種類'
        = f.select :cuisine_type, ['和食', '洋食', '中華', 'イタリアン'], {}, class: "select select-bordered w-full", autofocus: true
      .form-group
        = f.label :dish_type, '料理のタイプ'
        = f.select :dish_type, ['主菜', '副菜', '主食', 'デザート'], {}, class: "select select-bordered w-full"
      div data-controller="ingredients"
        label for="ingredients_input" 使いたい食材1
        input#ingredients_input data-ingredients-target="input" type="text" data-action="input->ingredients#update" class="input input-bordered w-full"
        div data-ingredients-target="suggestions" class="absolute z-10 w-full bg-white shadow-md mt-1"
      div data-controller="ingredients"
        label for="ingredients_input" 使いたい食材2
        input#ingredients_input data-ingredients-target="input" type="text" data-action="input->ingredients#update" class="input input-bordered w-full"
        div data-ingredients-target="suggestions" class="absolute z-10 w-full bg-white shadow-md mt-1"
      div data-controller="ingredients"
        label for="ingredients_input" 使いたい食材3
        input#ingredients_input data-ingredients-target="input" type="text" data-action="input->ingredients#update" class="input input-bordered w-full"
        div data-ingredients-target="suggestions" class="absolute z-10 w-full bg-white shadow-md mt-1"
      .form-group
        = f.label :number, '食べる人数(名)'
        = f.select :number, (1..4).to_a, {}, class: "select select-bordered w-full"
      .form-group
        = f.label :additional_ingredient_suggestions, '食材の追加を許可する'
        = f.select :additional_ingredient_suggestions, ['はい', 'いいえ'], {}, class: "select select-bordered w-full"
      .form-group
        = f.label :cooking_time, '最大調理時間'
        = f.select :cooking_time, ['10分未満', '10分', '15分', '20分', '25分', '30分'], {}, class: "select select-bordered w-full"
      .actions
        = f.submit 'レシピを生成する', class: "btn btn-primary w-full mt-4 mb-10"

```


### リクエスト送信前にフォームへ入力した時点のスクリーンショットです。
ブラウザの検証ツールに`input`と`item`を`console.log`で出力しています。
[ブラウザのスクリーンショット](https://gyazo.com/29c6eb3de2dc96ce1f3fd780b288cb55)


### 試行した際の`log/development.log`がこちらです。
`Rails.logger`でフォームから取得した値を表示させています。
```
Started POST "/recipes" for 192.168.65.1 at 2024-05-14 09:46:49 +0900
Cannot render console from 192.168.65.1! Allowed networks: 127.0.0.0/127.255.255.255, ::1
Processing by RecipesController#create as TURBO_STREAM
  Parameters: {"authenticity_token"=>"[FILTERED]", "cuisine_type"=>"洋食", "dish_type"=>"副菜", "number"=>"3", "additional_ingredient_suggestions"=>"はい", "cooking_time"=>"15分", "commit"=>"レシピを生成する"}
  [1m[36mUser Load (1.7ms)[0m  [1m[34mSELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2[0m  [["id", 1], ["LIMIT", 1]]
cuisine_type: 洋食
dish_type: 副菜
ingredients: [nil, nil, nil]
number: 3
additional_ingredient_suggestions: はい
allergy_restrictions: 
cooking_time: 15分

```

以上です。
よろしくお願いいたします。
