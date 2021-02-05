require 'rails_helper'

RSpec.describe "heroes show page", type: :feature do
  it "parent show page shows list of parents and all attributes" do
    hero = Hero.create(name: 'Hero')

    visit "/heroes/#{hero.id}"

    expect(page).to have_content(hero.name)
    expect(page).to have_content(hero.alive)
    expect(page).to have_content(hero.level)
    expect(page).to have_content(hero.created_at)
    expect(page).to have_content(hero.updated_at)
  end

end
