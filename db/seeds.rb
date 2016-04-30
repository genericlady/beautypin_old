15.times do |n|
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(
               email: email,
               password:              password,
               password_confirmation: password
               )
end


User.create!(email: 'normal@gmail.com', password: 'password', role: 0)
User.create!(email: 'owner@gmail.com', password: 'password', role: 1)
User.create!(email: 'admin@gmail.com', password: 'password', role: 2)

Deal.create!(title: '5 Mani and Pedis only 90$!', description: 'The very best mani pedis in town!', discount: 10)
Deal.create!(title: '4 Blowouts for 80$', description: 'Curly hair no problem!', discount: 20)
Deal.create!(title: '2 vials of Juviderm 400$!', description: 'Turn that frown upside down!', discount: 15)
