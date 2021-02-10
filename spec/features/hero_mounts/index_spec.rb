require 'rails_helper'

RSpec.describe "parent child index page" do
  it "parent child index page shows list childs and attributes" do
    Hero.destroy_all
    Mount.destroy_all
    hero1 = Hero.create(name: 'Hero', alive: false, level: 1)
    mount1 = hero1.mounts.create(name: "Bob", level: 1, fly: true)
    mount2 = hero1.mounts.create(name: "Janis", level: 4, fly: true)
    mount3 = hero1.mounts.create(name: "T2", level: 15, fly: true)
    mount4 = hero1.mounts.create(name: "Moo", level: 9, fly: true)
    mount5 = hero1.mounts.create(name: "Titan", level: 17, fly: true)

    visit "/heroes/#{hero1.id}/mounts"

    expect(page).to have_link("#{mount1.name}")
    expect(page).to have_content("#{mount1.fly}")
    expect(page).to have_content("#{mount1.level}")
    expect(page).to have_content("#{mount1.created_at}")
    expect(page).to have_content("#{mount1.updated_at}")

    expect(page).to have_link("#{mount2.name}")
    expect(page).to have_content("#{mount2.fly}")
    expect(page).to have_content("#{mount2.level}")
    expect(page).to have_content("#{mount2.created_at}")
    expect(page).to have_content("#{mount2.updated_at}")

    expect("Bob").to appear_before("Janis")
    expect("Janis").to appear_before("T2")

    expect(page).to have_link("Sort by name")
    click_link('Sort by name')
    expect(current_path).to eq("/heroes/#{hero1.id}/mounts")
    expect("Bob").to appear_before("Janis")
    expect("Janis").to appear_before("T2")

    expect(page).to have_button('All Mounts above level')
    fill_in "level", with: 5
    click_button('All Mounts above level')

    expect("T2").to appear_before("Titan")
  end
end
