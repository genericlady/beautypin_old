# features
- Normal registered users can search for any deal by title and current location
- Devise for Authentication
- Pundit for Authorization

# Accounts that have been seeded into db
```
bin/rake db:seed
```

## Admin Account with User deletion privelages
- email: admin@gmail.com
- password: password

## Owner Account with CRUD Privelages for Deals
A normal user account can search for deals by place, title and sort by discount.
- email: owner@gmail.com
- password: password

## Regular user account
- email: normal@gmail.com
- password: password

# tests
RSpec - Passing

