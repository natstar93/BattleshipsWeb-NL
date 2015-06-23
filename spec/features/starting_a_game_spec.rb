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
    expect(page).to have_content "Welcome to Battleships, Bob!"
  end

  scenario 'does not allow name field to be submitted if blank' do
    visit '/New_Game'
    click_button('Submit')
    expect(page).to have_content "Please fill in your name"
  end

  scenario 'the new game page should have a board' do
    visit '/New_Game?name=Bob'
    expect(page).to have_selector('.board')
  end

  scenario 'the board should allow the user to submit coordinates' do
    visit '/New_Game?name=Bob'
    fill_in('coordinates', with: 'A1')
    click_button('Submit')
    expect(page).to have_content('Location hit')
  end

end