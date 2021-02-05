require 'rails_helper'

RSpec.describe "heroes index page", type: :feature do
  it "parent index page shows list of parents" do
    hero = Hero.create(name: 'Hero')

    visit '/heroes'

    expect(page).to have_content(hero.name)
  end

end
