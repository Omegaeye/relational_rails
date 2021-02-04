require 'rails_helper'

RSpec.describe "teams delete", type: :feature do
  it "parent show page has delete link and it deletes team" do
    team = Team.create(name: "Team", city: "City")
    player = team.players.create(name: "Andrew", age: 20, )
    visit "/teams/#{team.id}"

    expect(page).to have_button("Delete")
    click_button("Delete")
    expect(current_path).to eq('/teams')
    expect(page).to_not have_content("City Team")
  end
end
