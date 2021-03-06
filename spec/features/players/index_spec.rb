require 'rails_helper'

RSpec.describe "players index page", type: :feature do
  it "player index page shows list of players and attributes" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, position: "1B", starter: true)

    visit '/players'

    expect(page).to have_link("#{player.name}")
    expect(page).to have_content("#{player.position}")
    expect(page).to have_content("#{player.age}")
    expect(page).to have_content("#{player.starter}")
    expect(page).to have_content("#{player.created_at}")
    expect(page).to have_content("#{player.updated_at}")

    expect(page).to have_button("Search Player By Name")
    click_button("Search Player By Name")
    expect(current_path).to eq('/players')
  end
end
