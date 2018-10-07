require 'rails_helper'

RSpec.feature 'Sign up user' do

  scenario 'Sign up user with success' do
    visit '/'
    click_link 'Sign Up'

    fill_in 'Email', with: 'tolsee3@gmail.com'
    fill_in 'Password', with: 'thisisthe'
    fill_in 'Password confirmation', with: 'thisisthe'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully.')
  end

  scenario 'Sign up error when invlid' do
    visit '/'
    click_link 'Sign Up'

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'

    expect(page).to have_content('error')
  end
end