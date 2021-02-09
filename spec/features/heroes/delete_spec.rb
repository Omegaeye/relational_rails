require 'rails_helper'

RSpec.describe "heroes delete" do
  it "parent show page has delete link and it deletes parent" do
    hero = Hero.create(name: 'Hero4', alive: true, level: 1)
    mount = hero.mounts.create(name: "Mount", level: 20)
    visit "/heroes/#{hero.id}"

    expect(page).to have_button("Delete Hero")
    click_button("Delete Hero")
    expect(current_path).to eq('/heroes')
    expect(page).to_not have_content("Hero4")
  end
end
