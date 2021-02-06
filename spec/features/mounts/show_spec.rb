require 'rails_helper'

RSpec.describe "child show page" do
  it "child show page shows child and attributes" do
    hero = Hero.create(name: 'Hero', alive: false, level: 1)
    mount = hero.mounts.create(name: "Mount", level: 20)
    visit "/mounts/#{mount.id}"

    expect(page).to have_content("#{mount.name}")
    expect(page).to have_content("#{mount.level}")
    expect(page).to have_content("#{mount.fly}")
    expect(page).to have_content("#{mount.created_at}")
    expect(page).to have_content("#{mount.updated_at}")
  end
end
