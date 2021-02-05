require 'rails_helper'

RSpec.describe "heroes new page" do
  it "parent create lives in parent index creates new parent" do
    hero = Hero.create(name: "Hero2", level: 1, alive: true)
    mount = hero.mounts.create(name: "Mount", level: 20)
    visit '/heroes'

    expect(page).to have_button("New Hero")
    click_button "New Hero"
    expect(current_path).to eq("/heroes/new")
    fill_in "name", with: "hero3"
    click_button "submit"
    expect(current_path).to eq("/heroes")
    expect(page).to have_link("hero3")
  end
end
