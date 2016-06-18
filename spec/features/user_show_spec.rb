# require 'rails_helper'
#
# feature 'User profile page', :devise do
#   before(:each) do
#     user = create(:user)
#     user.confirmed_at = Time.zone.now
#     user.location.build(city: 'new york', state: 'ny')
#     user.save
#
#     user2 = create(:user, email: 'user2@example.com')
#     user2.location.build(city: 'miami', state: 'fl')
#     user2.save
#     @request.env["devise.mapping"] = Devise.mappings[:user]
#     sign_in user
#   end
#
#   xscenario 'user sees their own profile' do
#     visit user_path(user)
#     # expect(page).to have_content 'User'
#   end
#
#   xscenario "user cannot see user2's profile" do
#     Capybara.current_session.driver.header 'Referer', root_path
#     visit user_path(user2)
#     expect(page).to have_content 'Access denied.'
#   end
# end
