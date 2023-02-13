require 'faker'

users = []
recipes = []

users.push(User.create!(name: 'Tiago', email: 'tiago.lelinski@gmail.com', password: '123321'))

5.times do
  users.push(User.create do |user| 
    user.name = Faker::FunnyName.name_with_initial
    user.email = Faker::Internet.email
    user.password = Faker::Internet.password
  end
  )
end

users.each do |user|
  7.times do
    user_recipe = Recipe.create do |recipe|
      recipe.name = Faker::Food.dish
      recipe.preparation_time =  rand(0.1..3.0).round(2)
      recipe.cooking_time = rand(0.1..3.0).round(2)
      recipe.description = Faker::Food.description
      recipe.public = true
      recipe.user_id = user.id
    end
  end
end

