require 'rails_helper'

RSpec.describe "child index page" do
  it "child index page shows list childs and attributes" do
    hero = Hero.create(name: 'Hero', alive: false, level: 1)
    mount = hero.mounts.create(name: "Mount", level: 20, fly: true)
    visit "/mounts"

    expect(page).to have_link("#{mount.name}")
    expect(page).to have_content("#{mount.level}")
    expect(page).to have_content("#{mount.fly}")
    expect(page).to have_content("#{mount.created_at}")
    expect(page).to have_content("#{mount.updated_at}")
  end
end
