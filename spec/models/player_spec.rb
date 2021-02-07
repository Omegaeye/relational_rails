require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to :team }
  end

  describe 'class methods' do
    it 'starters' do
      Team.destroy_all
      Player.destroy_all
      team1 = Team.create(name: "Team", city: "City")
      team2 = Team.create(name: "Team2", city: "City2")
      player1 = team1.players.create(name: "Andrew", age: 20, position: '1B', starter: true)
      player2 = team1.players.create(name: "Khoa", age: 34, position: '2B')

      expect(Player.starters).to eq([player1])

      player3 = team2.players.create(name: "Janis", age: 25, position: 'SS', starter: true)

      expect(Player.starters).to eq([player1, player3])
    end

    it 'over_age' do
      Team.destroy_all
      Player.destroy_all
      team1 = Team.create(name: "Team", city: "City")
      player1 = team1.players.create(name: "Andrew", age: 20, position: '1B')
      player2 = team1.players.create(name: "Khoa", age: 34, position: '2B')

      expect(Player.over_age(24)).to eq([player2])

      player3 = team1.players.create(name: "Janis", age: 25, position: 'SS')

      expect(Player.over_age(24)).to eq([player2, player3])
      expect(Player.over_age('')).to eq([player1, player2, player3])
    end

    it 'sorted' do
      Team.destroy_all
      Player.destroy_all
      team1 = Team.create(name: "Team", city: "City")
      player1 = team1.players.create(name: "Andrew", age: 20, position: '1B')
      player2 = team1.players.create(name: "Khoa", age: 34, position: '2B')
      player3 = team1.players.create(name: "Janis", age: 25, position: 'SS')

      expect(Player.sorted).to eq([player1, player3, player2])
    end

    it 'name search' do
      Team.destroy_all
      Player.destroy_all
      team1 = Team.create(name: "Team", city: "City")
      player1 = team1.players.create(name: "Andrew", age: 20, position: '1B', starter: true)
      player2 = team1.players.create(name: "Khoa", age: 34, position: '2B', starter: true)
      player3 = team1.players.create(name: "Janis", age: 25, position: 'SS', starter: true)

      expect(Player.name_search('drew')).to eq([player1])
      expect(Player.name_search('a')).to eq([player1, player2, player3])
      expect(Player.name_search('aojui')).to eq([])
      expect(Player.name_search('')).to eq([player1, player2, player3])
    end
  end
end
