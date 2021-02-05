require 'rails_helper'

RSpec.describe "child delete" do
  it "child show page hash delete childs" do
    hero = Hero.create(name: 'Hero', alive: false, level: 1)
    mount = hero.mounts.create(name: "Mount", level: 20)
    visit "/mounts/#{mount.id}"

    expect(page).to have_button("Delete")
    click_button("Delete")
    expect(current_path).to eq('/mounts')
    expect(page).to_not have_content("Andrew")
  end
end
