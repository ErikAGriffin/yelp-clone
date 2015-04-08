require 'rails_helper'

feature 'Reviewing Restaurants' do

  before {Restaurant.create name: 'Spankys'}

  scenario 'Allows users to leave a review' do

    visit '/restaurants'
    click_link 'Review Spankys'
    fill_in "Thoughts", with: "Terrible Management"
    select '3', from: "Rating"
    click_button "Leave Review"

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Terrible Management')

  end

end
