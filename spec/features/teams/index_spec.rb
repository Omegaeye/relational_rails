require 'rails_helper'

RSpec.describe "teams index page", type: :feature do
  it "parent index page shows list of parents and attributes" do
    Team.destroy_all
    Player.destroy_all
    team1 = Team.create(name: "Team1", city: "City")
    player = team1.players.create(name: "Andrew", age: 20)
    team2 = Team.create(name: "Team2", city: "City2")
    player2 = team2.players.create(name: "Khoa", age: 20)
    player3 = team2.players.create(name: "Janis", age: 20)
    visit '/teams'

    expect(page).to have_link("#{team1.city} #{team1.name}")
    expect(page).to have_content("#{team1.rank}")
    expect(page).to have_content("#{team1.first_place}")
    expect(team1.name).to appear_before(team2.name)

    expect(page).to have_link("Sort Teams By Number of Players")
    click_link ("Sort Teams By Number of Players")
    expect(current_path).to eq('/teams')
    expect(team2.name).to appear_before(team1.name)

    expect(page).to have_button("Search Team By Name")
    click_button("Search Team By Name")
    expect(page).to have_link("#{team1.city} #{team1.name}")
  end
end
