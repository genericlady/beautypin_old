require 'rails_helper'

feature 'Deals index' do
  scenario 'normal user selects a state and gets a list of deals' do
    user = create(:user)
    user.confirm
    user.location = Location.new(city: 'astoria', state: 'new york')
    user.save
    login_as(user, scope: :user )

    visit '/'
    expect { find_link 'Deals', href: '/deals' }.not_to raise_error
    click_link 'Deals'
    expect(current_path).to eq('/deals')

    # expect { find_field('State') }.not_to raise_error
    # select state
    # list deals from that state
  end
  scenario 'normal user can select a state' do

  end

  scenario 'normal user now has a list of deals from selected state' do

  end

end
