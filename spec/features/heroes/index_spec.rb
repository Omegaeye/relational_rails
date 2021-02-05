require 'rails_helper'

RSpec.describe "heroes index page", type: :feature do
  it "parent index page shows list of parents" do
    hero = Hero.create(name: "Hero2", level: 1, alive: true)
    mount = hero.mounts.create(name: "Mount", level: 20, )
    visit '/heroes'

    expect(page).to have_link("#{hero.name}")
    expect(page).to have_content("#{hero.level}")
    expect(page).to have_content("#{hero.alive}")
  end

end
