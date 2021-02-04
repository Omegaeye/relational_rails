require 'rails_helper'

RSpec.describe "teams edit page", type: :feature do
  it "parent index has update link and it updates team" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, )
    visit "/teams/#{team.id}"

    expect(page).to have_button("Update Team")
    click_button "Update Team"
    expect(current_path).to eq("/teams/#{team.id}/edit")
    fill_in "name", with: "Team 2"
    fill_in "city", with: "City 2"
    click_button "Update"
    expect(current_path).to eq("/teams/#{team.id}")
    expect(page).to have_content("City 2 Team 2")
    expect(page).to have_content("#{team.rank}")
    expect(page).to have_content("#{team.first_place}")
    expect(page).to have_content("#{team.created_at}")
    expect(page).to have_content("#{team.updated_at}")
  end
end
