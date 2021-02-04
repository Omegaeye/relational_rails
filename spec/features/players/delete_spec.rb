require 'rails_helper'

RSpec.describe "player delete", type: :feature do
  it "player show page has delete link and it deletes player" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, position: "1B")
    visit "/players/#{player.id}"

    expect(page).to have_button("Delete")
    click_button("Delete")
    expect(current_path).to eq('/players')
    expect(page).to_not have_content("Andrew")
  end
end
