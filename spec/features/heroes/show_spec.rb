require 'rails_helper'

RSpec.describe "heroes show page", type: :feature do
  it "parent show page shows list of parents and all attributes" do
    hero = Hero.create(name: 'Hero', alive: false, level: 1)
    mount = hero.mounts.create(name: "Mount", level: 20)

    visit "/heroes/#{hero.id}"

    expect(page).to have_content(hero.name)
    expect(page).to have_content(hero.alive)
    expect(page).to have_content(hero.level)
    expect(page).to have_content(hero.created_at)
    expect(page).to have_content(hero.updated_at)
    expect(page).to have_link("Update Hero")
    click_link "Update Hero"
    expect(current_path).to eq("/heroes/#{hero.id}/edit")

    visit "/heroes/#{hero.id}"

    expect(page).to have_link("Mounts Page")
    click_link "Mounts Page"
    expect(current_path).to eq("/heroes/#{hero.id}/mounts")

  end

end
