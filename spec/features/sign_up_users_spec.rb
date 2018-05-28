require 'rails_helper'

RSpec.feature 'Sign up user' do

  scenario 'Sign up user with success' do
    visit '/'
    click_link 'Sign Up'

    fill_in 'Email', with: 'tolsee3@gmail.com'
    fill_in 'Password', with: 'thisisthe'
    fill_in 'Confirm Password', with: 'thisisthe'
    click_button 'Sign Up'

    expect(page).to have_content('You have successfully signed up!')
  end

  scenario 'Sign up error when invlid' do
    visit '/'
    click_link 'Sign Up'

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Confirm Password', with: ''
    click_button 'Sign Up'

    expect(page).to have_content('You have not signed up successfully!')
  end
end