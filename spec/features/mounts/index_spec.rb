require 'rails_helper'

RSpec.describe "child index page" do
  it "child index page shows list childs and attributes" do
    hero = Hero.create(name: 'Hero', alive: false, level: 1)
    mount1 = hero.mounts.create(name: "Moo", level: 20, fly: true)
    mount2 = hero.mounts.create(name: "More", level: 20, fly: true)
    mount3 = hero.mounts.create(name: "Blast", level: 20, fly: true)

    visit "/mounts"

    expect(page).to have_link("#{mount1.name}")
    expect(page).to have_content("#{mount1.level}")
    expect(page).to have_content("#{mount1.fly}")
    expect(page).to have_content("#{mount1.created_at}")
    expect(page).to have_content("#{mount1.updated_at}")

    expect("Moo").to appear_before("More")
    expect("More").to appear_before("Blast")

    expect(page).to have_button('Search Name')
    fill_in "name", with: "Mo"
    click_button('Search Name')

    expect("Moo").to appear_before("More")
    expect(page).to_not have_content("#{mount3.name}")

  end
end
