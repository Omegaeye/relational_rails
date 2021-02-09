require 'rails_helper'

RSpec.describe "child index page" do
  it "child index page shows list childs and attributes" do
    hero = Hero.create(name: 'Hero', alive: false, level: 1)
    mount = hero.mounts.create(name: "Mount", level: 20)
    visit "/mounts/#{mount.id}"

    expect(page).to have_link("Update Mount")
    click_link "Update Mount"
    expect(current_path).to eq("/mounts/#{mount.id}/edit")
    fill_in "name", with: "Drew"
    fill_in "level", with: 10
    click_button "submit"
    expect(current_path).to eq("/mounts/#{mount.id}")
    expect(page).to have_content("#{mount.name}")
    expect(page).to have_content("#{mount.level}")
    expect(page).to have_content("#{mount.created_at}")
    expect(page).to have_content("#{mount.updated_at}")
  end
end
