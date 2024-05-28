AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

5.times do
  Project.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    start_at: DateTime.now - rand(1..5).days,
    finish_at: DateTime.now + rand(1..5).days,
    budget: rand(1..20) * 100
  )
end
7.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    position: rand(0..5)
  )
  rand(1..3).times do
    Project.all.sample.users << user
  end
end

User.create!(
  email: "user@example.com",
  password: 'password',
  password_confirmation: 'password',
  position: rand(0..5)
)
