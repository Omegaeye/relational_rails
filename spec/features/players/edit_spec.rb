require 'rails_helper'

RSpec.describe "players update page", type: :feature do
  it "player show page shows player and attributes" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, position: "1B")
    visit "/players/#{player.id}"

    expect(page).to have_button("Update Player")
    click_button "Update Player"
    expect(current_path).to eq("/players/#{player.id}/edit")
    fill_in "name", with: "Drew"
    fill_in "age", with: "31"
    fill_in "position", with: "2B"
    click_button "Update"
    expect(current_path).to eq("/players/#{player.id}")
    expect(page).to have_content("Drew")
    expect(page).to have_content("31")
    expect(page).to have_content("2B")
    expect(page).to have_content("#{team.created_at}")
    expect(page).to have_content("#{team.updated_at}")
  end
end
