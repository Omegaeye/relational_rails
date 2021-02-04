require 'rails_helper'

RSpec.describe "teams index page", type: :feature do
  it "parent index page shows list of parents" do
    team = Team.create(name: "Team", city: "City")

    visit '/teams'

    expect(page).to have_link("#{team.name}")
    expect(page).to have_content("#{team.first_place}")
    expect(page).to have_content("#{team.rank}")
    expect(page).to have_content("#{team.created_at}")
    expect(page).to have_content("#{team.updated_at}")
  end

end
