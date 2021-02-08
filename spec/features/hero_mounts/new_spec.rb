require 'rails_helper'

RSpec.describe "child mounts new page" do
  it "child new lives in parent show and creates new child" do
    hero = Hero.create(name: 'Hero', alive: false, level: 1)
    mount = hero.mounts.create(name: "Mount", level: 20)
    mount2 = hero.mounts.create(name: "M2", level: 20)
    mount3 = hero.mounts.create(name: "T2", level: 20)

    visit "/heroes/#{hero.id}/mounts"

    expect(page).to have_link("Add New Mount")
    click_link "Add New Mount"
    expect(current_path).to eq("/heroes/#{hero.id}/mounts/new")
    fill_in "name", with: "Janis"
    click_button "submit"
    expect(current_path).to eq("/heroes/#{hero.id}/mounts")
    expect(page).to have_link("Janis")
  end
end
