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

      expect(Hero.sorted).to eq([hero1, hero2])
    end

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

end
