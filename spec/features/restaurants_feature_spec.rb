require 'rails_helper'

feature 'restaurants' do

  context 'A clean slate' do

    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add one!'
    end

  end

  context 'Creating a restaurant' do

    scenario 'A user clicks the Add Restaurant button' do
      vist '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Spankys'
      click_button 'Add Restaurant'
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Spankys'
    end

  end

  context 'There are restaurants' do
    before do
      Restaurant.create(name: 'Meedos')
    end

    scenario 'Restaurants are displayed' do
      visit '/restaurants'
      expect(page).not_to have_content "No restaurants yet"
      expect(page).to have_content "Meedos"
    end



  end


end