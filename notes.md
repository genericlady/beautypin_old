# TODO
when user signs in get city and state
a user should have a location
Geokit::Geocoders::MultiGeocoder.geocode("67.250.81.21"))


create models employee, appointment
beauty_place has many employee

appointment has a time
appointment belongs to employee
appointment belongs to user

user has many appointments
user has one employee through appointments

write seed data

#Flow
normal user

post to search action
<!-- POST '/deals/results' -->
list all deals by state

if owner
select beauty_place
add services with price
select discount
save deal
publish deal

if admin
list all beauty places alphabetically
create, edit, update, publish, delete buttons
