require 'rails_helper'

RSpec.describe "teams index page", type: :feature do
  it "parent index page shows list of parents and attributes" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, )
    visit '/teams'

    expect(page).to have_link("#{team.city} #{team.name}")
    expect(page).to have_content("#{team.rank}")
    expect(page).to have_content("#{team.first_place}")
  end
end
