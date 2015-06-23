require 'spec_helper'

feature 'Starting a new game' do
  scenario 'asks the user for their name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'allows the user to input their name' do
    visit '/New_Game'
    fill_in('name', with: 'Bob')
    click_button('Submit')
    expect(page).to have_content "Welcome to Battleships, Bob"
  end
end