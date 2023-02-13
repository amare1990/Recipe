require 'faker'
users = []
foods = []

users.push(User.create(name: 'Amare', email: 'amare@test.com', password: '12345678'))
users.push(User.create(name: 'Tiago', email: 'tiago.lelinski@gmail.com', password: '123456'))

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
    foods.push(Food.create do |food|
      food.name = Faker::Food.ingredient
      food.measurement_unit = Faker::Food.metric_measurement
      food.price = rand(0.1..16.0).round(2)
      food.quantity = rand(0.1..16.0).round(2)
      food.user_id = user.id
    end
    )
  end
end
