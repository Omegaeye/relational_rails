require 'rails_helper'

RSpec.describe "teams show page", type: :feature do
  it "parent id page has correct parent and attributes" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, )
    visit "/teams/#{team.id}"

    expect(page).to have_content("#{team.city} #{team.name}")
    expect(page).to have_content("#{team.rank}")
    expect(page).to have_content("#{team.first_place}")
    expect(page).to have_content("#{team.created_at}")
    expect(page).to have_content("#{team.updated_at}")
    expect(page).to have_button("Update Team")
    click_button "Update Team"
    expect(current_path).to eq("/teams/#{team.id}/edit")

    visit "/teams/#{team.id}"

    click_button "Add New Player"
    expect(current_path).to eq("/teams/#{team.id}/players/new")

    visit "/teams/#{team.id}"

    expect(page).to have_link("All #{team.name} Players")
    click_link "All #{team.name} Players"
    expect(current_path).to eq("/teams/#{team.id}/players")
  end
end
