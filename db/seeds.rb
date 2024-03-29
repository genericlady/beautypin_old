User.create!(email: 'normal@gmail.com', password: 'password', role: 0).confirm
User.create!(email: 'admin@gmail.com', password: 'password', role: 2).confirm
owner = User.create!(email: 'owner@gmail.com', password: 'password', role: 1)
owner.confirm

beauty_place = owner.beauty_places.create(name: 'Sassoon', published: true)

100.times do |num|
  beauty_place.deals.create(
    title: 'Deal #' + num.to_s,
    description: 'This is a generic deal',
    discount: rand(100)
  )
end

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
beauty_place.location = Location.create(city: 'new york', state: 'ny')

beauty_place2 = BeautyPlace.create!(name: 'Thomas A. Anderson Capital City Spa', published: true)
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
beauty_place2.location = Location.create(city: 'san francisco', state: 'ca')
