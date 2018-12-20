require 'rails_helper'

RSpec.feature 'Signing out user' do
  before do
    @join = User.create!(email: 'james@gmail.com', password: 'jamesismyname')
    visit '/'

    click_link 'Login'
    fill_in 'Email', with: 'james@gmail.com'
    fill_in 'Password', with: 'jamesismyname'
    click_button 'Log in'
  end

  scenario 'User can sign out' do
    visit '/'
    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).not_to have_content('Sign Out')
  end
end