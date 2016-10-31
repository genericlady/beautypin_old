# features
- Normal registered users can search for any deal by title and current location
- Devise for Authentication
- Pundit for Authorization
- Facebook login with omniauth

# Accounts that have been seeded into db
```
bin/rake db:seed
```
# Multiple Roles for a Single Class

## Admin Account with User deletion privelages
An admin can view all users, change their roles or delete user.
- email: admin@gmail.com
- password: password

## Owner Account with CRUD Privelages for Deals
- email: owner@gmail.com
- password: password

## Regular user account
A normal user account can search for deals by place, title and sort by discount.
- email: normal@gmail.com
- password: password

# tests
RSpec - Passing

