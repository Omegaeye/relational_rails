require 'rails_helper'

RSpec.describe "teams new page", type: :feature do
  it "team create lives in team index creates new team" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, )
    visit '/teams'

    expect(page).to have_button("New Team")
    click_button "New Team"
    expect(current_path).to eq("/teams/new")
    fill_in "name", with: "Team 2"
    fill_in "city", with: "City 2"
    click_button "Create"
    expect(current_path).to eq("/teams")
    expect(page).to have_link("City 2 Team 2")
  end
end
