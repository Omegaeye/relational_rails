require 'rails_helper'

RSpec.describe "heroes new page" do
  it "parent create lives in parent index creates new parent" do
    hero = Hero.create(name: "Hero2", level: 1, alive: true)
    mount = hero.mounts.create(name: "Mount", level: 20)
    visit '/heroes'

    expect(page).to have_link("Create New Hero")
    click_link "Create New Hero"
    expect(current_path).to eq("/heroes/new")
    fill_in "name", with: "hero3"
    click_button "Create Hero"
    expect(current_path).to eq("/heroes")
    expect(page).to have_content("Hero3")

    expect("Hero3").to_not appear_before("Hero2", only_text: true)
  end
end
