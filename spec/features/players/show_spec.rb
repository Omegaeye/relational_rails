require 'rails_helper'

RSpec.describe "players show page", type: :feature do
  it "player show page shows player and attributes" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, position: "1B")
    visit "/players/#{player.id}"

    expect(page).to have_content("#{player.name}")
    expect(page).to have_content("#{player.position}")
    expect(page).to have_content("#{player.age}")
    expect(page).to have_content("#{player.starter}")
    expect(page).to have_content("#{player.created_at}")
    expect(page).to have_content("#{player.updated_at}")
  end
end
