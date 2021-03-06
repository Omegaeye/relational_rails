require 'rails_helper'

RSpec.describe "players index page", type: :feature do
  it "player index page shows list of players and attributes" do
    team = Team.create(name: "Team", city: "City")
    player1 = team.players.create(name: "Andrew", age: 29, position: "1B")
    player2 = team.players.create(name: "Khoa", age: 34, position: "3B")
    player3 = team.players.create(name: "Janis", age: 25, position: "2B")
    visit "teams/#{team.id}/players"

    expect(page).to have_content("All #{team.name} Players")

    expect(page).to have_link("#{player1.name}")
    expect(page).to have_content("#{player1.position}")
    expect(page).to have_content("#{player1.age}")
    expect(page).to have_content("#{player1.starter}")
    expect(page).to have_content("#{player1.created_at}")
    expect(page).to have_content("#{player1.updated_at}")

    expect(page).to have_link("#{player2.name}")
    expect(page).to have_content("#{player2.position}")
    expect(page).to have_content("#{player2.age}")
    expect(page).to have_content("#{player2.starter}")
    expect(page).to have_content("#{player2.created_at}")
    expect(page).to have_content("#{player2.updated_at}")

    expect(page).to have_link("#{player3.name}")
    expect(page).to have_content("#{player3.position}")
    expect(page).to have_content("#{player3.age}")
    expect(page).to have_content("#{player3.starter}")
    expect(page).to have_content("#{player3.created_at}")
    expect(page).to have_content("#{player3.updated_at}")

    expect(player1.name).to appear_before(player2.name)
    expect(player2.name).to appear_before(player3.name)

    expect(page).to have_link("Sort All #{team.name} Players By Name")
    click_link("Sort All #{team.name} Players By Name")
    expect(current_path).to eq("/teams/#{team.id}/players")
    expect(player1.name).to appear_before(player3.name)
    expect(player3.name).to appear_before(player2.name)

    expect(page).to have_button("Show All Players Over This Age")
    click_button("Show All Players Over This Age")
    expect(current_path).to eq("/teams/#{team.id}/players")
    fill_in "age_of", with: "28"
    click_on "Show All Players Over This Age"
    expect("Andrew").to appear_before("Khoa")
    fill_in "age_of", with: "20"
    click_on "Show All Players Over This Age"
    expect("Andrew").to appear_before("Khoa")
    expect("Khoa").to appear_before("Janis")
  end
end
