15.times do |n|
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(
               email: email,
               password:              password,
               password_confirmation: password)
end


User.create!(email: 'normal@gmail.com', password: 'password', role: 0)
User.create!(email: 'owner@gmail.com', password: 'password', role: 1)
User.create!(email: 'admin@gmail.com', password: 'password', role: 2)
