require 'rails_helper'

RSpec.feature 'Sign In user' do

  before do
    @join = User.create!(email: 'james@gmail.com', password: 'jamesismyname')
  end

  scenario 'User can sign in' do
    visit '/'

    click_link 'Login'
    fill_in 'Email', with: 'james@gmail.com'
    fill_in 'Password', with: 'jamesismyname'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content("Signed in as #{@join.email}")
    expect(page).not_to have_link('Sign In')
    expect(page).not_to have_link('Sign Up')
  end
end