15.times do |n|
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create(
               email: email,
               password:              password,
               password_confirmation: password
               )
end

User.create!(email: 'normal@gmail.com', password: 'password', role: 0)
User.create!(email: 'admin@gmail.com', password: 'password', role: 2)
owner = User.create!(email: 'owner@gmail.com', password: 'password', role: 1)

beauty_place = owner.beauty_places.create(name: 'Sassoon')
beauty_place.employees.create(name: 'Jessica')
beauty_place.employees.create(name: 'Beth')
beauty_place.employees.create(name: 'Scarlet')

beauty_place.deals.create(
                        title: '5 Mani and Pedis only 90$',
                        description: 'The very best mani pedis in town',
                        discount: 10
                        )
beauty_place.deals.create(
                        title: '4 Blowouts for 80$',
                        description: 'Curly hair no problem',
                        discount: 20
                        )
beauty_place.deals.create(
                        title: '2 vials of Juviderm 400$',
                        description: 'Turn that frown upside down',
                        discount: 15
                        )

beauty_place2 = BeautyPlace.create!(name: 'Thomas A. Anderson Capital City Spa')
beauty_place2.employees.create(name: 'Dujour')
beauty_place2.employees.create(name: 'Fiona Johnson')
beauty_place2.deals.create(
                      title: 'Microdermabrasion Facial x2 Bring a friend',
                      description: 'awesome facial package',
                      discount: 30
                        )
beauty_place2.deals.create(
                      title: 'Body Laser Hair Removal 12 sessions',
                      description: 'once a month laser',
                      discount: 20
                      )
