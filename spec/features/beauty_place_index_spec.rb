require 'rails_helper'

describe 'Beauty Place index page' do
  let!(:user) { create :user }

  before(:each) do
    create(:salon)
  end

  scenario 'normal user sees all beauty places without crud panel' do
    expect(user.role).to eq('normal')
    sign_in user.email, user.password

    visit '/index'
    expect(page).to have_content 'Vidal Sassoon'
    expect(page).not_to have_content 'Create'
  end

  scenario 'admin sees all beauty places with crud panel' do
    user.role = 1
    user.save
    expect(user.role).to eq('owner')
    sign_in user.email, user.password

    visit '/index'
    expect(page).to have_content 'Vidal Sassoon'

    context 'has buttons create, edit and delete' do
      binding.pry
      buttons = []
      buttons << find_button('Create')
      buttons << find_button('Edit')
      buttons << find_button('Delete')
    end

  end

  scenario 'owner sees only their own beauty places with crud panel' do

  end
end
