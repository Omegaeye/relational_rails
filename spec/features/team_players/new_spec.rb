require 'rails_helper'

RSpec.describe "team players new page", type: :feature do
  it "players new lives in team show and creates new player" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, position: "1B")
    visit "/teams/#{team.id}/players"

    expect(page).to have_button("Add New Player")
    click_button "Add New Player"
    expect(current_path).to eq("/teams/#{team.id}/players/new")
    fill_in "name", with: "Janis"
    fill_in "age", with: "25"
    fill_in "position", with: "2B"
    click_button "Create"
    expect(current_path).to eq("/teams/#{team.id}/players")
    expect(page).to have_link("Janis")
  end
end
