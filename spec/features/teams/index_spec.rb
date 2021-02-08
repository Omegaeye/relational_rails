require 'rails_helper'

RSpec.describe "teams index page", type: :feature do
  it "parent index page shows list of parents and attributes" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20)
    visit '/teams'

    expect(page).to have_link("#{team.city} #{team.name}")
    expect(page).to have_content("#{team.rank}")
    expect(page).to have_content("#{team.first_place}")

    team2 = Team.create(name: "Team2", city: "City2")
    player2 = team.players.create(name: "Khoa", age: 20)
    player2 = team.players.create(name: "Janis", age: 20)

    expect(page).to have_link("Sort Teams By Number of Players")
    click_link ("Sort Teams By Number of Players")
    expect(current_path).to eq('/teams')

    expect(page).to have_button("Search Team By Name")
    click_button("Search Team By Name")
    expect(page).to have_link("#{team.city} #{team.name}")
  end
end
