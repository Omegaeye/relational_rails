require 'rails_helper'

RSpec.describe "heroes edit page" do
  it "parent index has update link and it updates parent" do
    hero = Hero.create(name: 'Hero', alive: true, level: 1)
    mount = hero.mounts.create(name: "Mount", level: 20)
    visit "/heroes/#{hero.id}"

    expect(page).to have_link("Update Hero")
    click_link "Update Hero"
    expect(current_path).to eq("/heroes/#{hero.id}/edit")
    fill_in "name", with: "Hero 2"
    fill_in "alive", with: false
    click_button "submit"
    expect(current_path).to eq("/heroes/#{hero.id}")
    expect(page).to have_content("Hero 2")
    expect(page).to have_content("#{hero.level}")
    expect(page).to have_content("#{hero.created_at}")
    expect(page).to have_content("#{hero.updated_at}")
  end
end
