require 'rails_helper'

RSpec.describe Hero do
  describe 'relationships' do
    it { should have_many :mounts }
  end

  describe 'class methods' do
    it 'sort' do
      hero1 = Hero.create(name: "Hero", level: 9)
      mount1 = hero1.mounts.create(name: "Andrew", level: 5)
      hero2 = Hero.create(name: "Steve", level: 7)
      mount2 = hero2.mounts.create(name: "kupo", level: 34)

      expect(Hero.sorted_by_created_at).to eq([hero1, hero2])
    end
  end

  it 'number of mounts' do
    Hero.destroy_all
    Mount.destroy_all
    hero1 = Hero.create(name: "Hero", level: 8)
    hero2 = Hero.create(name: "Andrew", level: 9)
    mount1 = hero1.mounts.create(name: "Andrew", level: 20, fly: true)
    mount2 = hero1.mounts.create(name: "Khoa", level: 34, fly: true)
    mount3 = hero2.mounts.create(name: "Janis", level: 25, fly: true)

    expect(Hero.number_of_mounts).to eq([hero1, hero2])

    hero3 = Hero.create(name: "Hero3", level: 8)
    mount1 = hero3.mounts.create(name: "Andrew", level: 20, fly: true)
    mount2 = hero3.mounts.create(name: "Khoa", level: 34, fly: true)
    mount3 = hero3.mounts.create(name: "Janis", level: 25, fly: true)

    expect(Hero.number_of_mounts).to eq([hero3, hero1, hero2])
  end

  describe 'instance methods' do
    it 'mount_count' do
      Hero.destroy_all
      Mount.destroy_all
      hero1 = Hero.create(name: "Hero", level: 9)
      mount1 = hero1.mounts.create(name: "Andrew")
      mount2 = hero1.mounts.create(name: "kupo", level: 34)

      expect(hero1.mount_count).to eq(2)
    end
  end

  describe 'search' do
    it 'name search' do
      Hero.destroy_all
      Mount.destroy_all
      hero1 = Hero.create(name: "Hero", level: 8)
      hero2 = Hero.create(name: "Andrew", level: 9)
      hero3 = Hero.create(name: "Krono", level: 10)

      expect(Hero.name_search('Andrew')).to eq([hero2])
      expect(Hero.name_search('r')).to eq([hero1, hero2, hero3])
      expect(Hero.name_search('sjpvj')).to eq([])
      expect(Hero.name_search('')).to eq([hero1, hero2, hero3])
    end
  end

end
