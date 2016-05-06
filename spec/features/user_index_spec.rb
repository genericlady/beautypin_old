require 'rails_helper'

feature 'User index page', :devise do
  scenario 'user sees their own email' do
    user = create(:user, :admin)
    user.confirm
    user.location = Location.new(city: 'miami', state: 'FL')
    login_as(user, scope: :user)
    visit users_path
  end
end
