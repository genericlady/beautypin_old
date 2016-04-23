require 'rails'

feature 'User index page', :devise do
  scenario 'user sees their own email' do
    user = create(:user, :admin)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.email
  end
end
