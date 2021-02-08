require 'rails_helper'

RSpec.describe "parent child index page" do
  it "parent child index page shows list childs and attributes" do
    hero = Hero.create(name: 'Hero', alive: false, level: 1)
    mount = hero.mounts.create(name: "Mount", level: 20, fly: true)
    mount2 = hero.mounts.create(name: "Janis", level: 20, fly: true)
    mount3 = hero.mounts.create(name: "T2", level: 20, fly: true)

    visit "/heroes/#{hero.id}/mounts"

    expect(page).to have_link("#{mount.name}")
    expect(page).to have_content("#{mount.fly}")
    expect(page).to have_content("#{mount.level}")
    expect(page).to have_content("#{mount.created_at}")
    expect(page).to have_content("#{mount.updated_at}")

    expect(page).to have_link("#{mount2.name}")
    expect(page).to have_content("#{mount2.fly}")
    expect(page).to have_content("#{mount2.level}")
    expect(page).to have_content("#{mount2.created_at}")
    expect(page).to have_content("#{mount2.updated_at}")

    expect(page).to have_link("Sort by name")
    click_link('Sort by name')
    expect(page).to have_button('All Mounts above level')
    click_button('All Mounts above level')
  end
end
