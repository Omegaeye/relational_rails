require 'rails_helper'

RSpec.describe Mount do
  describe 'relationships' do
    it { should belong_to :hero }
  end

  describe 'class methods' do
    it 'fly' do
      Hero.destroy_all
      Mount.destroy_all
      hero1 = Hero.create(name: "Hero", level: 5)
      hero2 = Hero.create(name: "hero2", level: 6)
      mount1 = hero1.mounts.create(name: "Andrew", level: 20, fly: true)
      mount2 = hero1.mounts.create(name: "Khoa", level: 34, fly: false)

      expect(Mount.fly).to eq([mount1])

      mount3 = hero2.mounts.create(name: "Janis", level: 25, fly: true)

      expect(Mount.fly).to eq([mount1, mount3])
    end

    it 'level_above' do
      Hero.destroy_all
      Mount.destroy_all
      hero1 = Hero.create(name: "Hero", level: 5)
      mount1 = hero1.mounts.create(name: "Andrew", level: 20, fly: true)
      mount2 = hero1.mounts.create(name: "Khoa", level: 34, fly: true)

      expect(Mount.level_above(24)).to eq([mount2])

      mount3 = hero1.mounts.create(name: "Janis", level: 25, fly: true)

      expect(Mount.level_above(24)).to eq([mount2, mount3])
      expect(Mount.level_above('')).to eq([mount1, mount2, mount3])
    end

    describe 'search' do
      it 'name search' do
        Hero.destroy_all
        Mount.destroy_all
        hero1 = Hero.create(name: "Hero", level: 8)
        mount1 = hero1.mounts.create(name: "Andrew", level: 20, fly: true)
        mount2 = hero1.mounts.create(name: "Khoa", level: 34, fly: true)
        mount3 = hero1.mounts.create(name: "Janis", level: 25, fly: true)

        expect(Mount.name_search('Andrew')).to eq([mount1])
        expect(Mount.name_search('a')).to eq([mount1, mount2, mount3])
        expect(Mount.name_search('sjpvj')).to eq([])
        expect(Mount.name_search('')).to eq([mount1, mount2, mount3])
      end
    end

    it 'sorted' do
      Hero.destroy_all
      Mount.destroy_all
      hero1 = Hero.create(name: "Hero", level: 5)
      mount1 = hero1.mounts.create(name: "Andrew", level: 20, fly: true)
      mount2 = hero1.mounts.create(name: "Khoa", level: 34, fly: true)
      mount3 = hero1.mounts.create(name: "Janis", level: 25, fly: true)

      expect(Mount.sorted).to eq([mount1, mount3, mount2])
    end
  end
end
