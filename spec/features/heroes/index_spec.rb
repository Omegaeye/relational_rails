require 'rails_helper'

RSpec.describe "heroes index page", type: :feature do
  it "parent index page shows list of parents" do
    hero1 = Hero.create(name: "Joe", level: 1, alive: true)
    hero2 = Hero.create(name: "Max", level: 10, alive: true)
    hero3 = Hero.create(name: "Matt", level: 10, alive: true)

    mount1 = hero3.mounts.create(name: "Tiger", level: 20)
    mount2 = hero3.mounts.create(name: "Car", level: 20)
    mount3 = hero1.mounts.create(name: "Bird", level: 20)
    mount4 = hero1.mounts.create(name: "Plane", level: 20)
    mount5 = hero2.mounts.create(name: "Boat", level: 20)

    visit '/heroes'

    expect(page).to have_link("#{hero1.name}")
    expect(page).to have_content("#{hero2.level}")
    expect(page).to have_content("#{hero3.alive}")

    expect("Joe").to appear_before("Max", only_text: true)
    expect("Max").to appear_before("Matt", only_text: true)


    expect(page).to have_link("Sort by #of Mounts")
    click_link("Sort by #of Mounts")
    expect(current_path).to eq('/heroes')

    expect("Matt").to appear_before("Max")
    expect("Joe").to appear_before("Max", only_text: true)

    expect(page).to have_button('Search Name')
    fill_in "name", with: "Ma"
    click_button('Search Name')

    expect("Max").to appear_before("Matt", only_text: true)
  end
end
