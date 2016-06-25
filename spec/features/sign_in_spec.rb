require 'rails_helper'

feature 'Sign in', :devise do
  scenario 'user cannot sign in if not registered' do
    sign_in('person@example.com', 'password')
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'user can sign in with valid credentials' do
    user = create(:user)
    user.confirm
    sign_in(user.email, user.password)
    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'user cannot sign in with the wrong email' do
    user = create(:user)
    sign_in('invalid@email', user.password)
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'user cannt sign in with the wrong password' do
    user = create(:user)
    sign_in(user.email, 'invalidpassword')
    expect(page).to have_content 'Invalid Email or password.'
  end
end
