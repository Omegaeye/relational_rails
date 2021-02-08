require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :players }
  end

  describe 'class methods' do
    it 'sort' do
      team1 = Team.create(name: "Team", city: "City")
      player1 = team1.players.create(name: "Andrew", age: 20, position: '1B')
      team2 = Team.create(name: "Team2", city: "City2")
      player2 = team2.players.create(name: "Khoa", age: 34, position: '2B')

      expect(Team.sorted).to eq([team1, team2])
    end

    it 'name search' do
      Team.destroy_all
      Player.destroy_all
      team1 = Team.create(name: "Team 1", city: "City")
      team2 = Team.create(name: "Team 2", city: "City")
      team3 = Team.create(name: "Team 3", city: "City")

      expect(Team.name_search('2')).to eq([team2])
      expect(Team.name_search('team')).to eq([team1, team2, team3])
      expect(Team.name_search('sjpvj')).to eq([])
      expect(Team.name_search('')).to eq([team1, team2, team3])
    end

    it 'number of players' do
      Team.destroy_all
      Player.destroy_all
      team1 = Team.create(name: "Team 1", city: "City")
      player1 = team1.players.create(name: "Andrew", age: 20, position: '1B')
      player2 = team1.players.create(name: "Khoa", age: 34, position: '2B')
      team2 = Team.create(name: "Team 2", city: "City")
      player3 = team2.players.create(name: "Andrew", age: 20, position: '1B')

      expect(Team.number_of_players).to eq([team1, team2])

      team3 = Team.create(name: "Team 3", city: "City")
      player4 = team3.players.create(name: "Andrew", age: 20, position: '1B')
      player5 = team3.players.create(name: "Andrew", age: 20, position: '1B')
      player6 = team3.players.create(name: "Andrew", age: 20, position: '1B')

      expect(Team.number_of_players).to eq([team3, team1, team2])
    end
  end

  describe 'instance methods' do
    it 'player_count' do
      Team.destroy_all
      Player.destroy_all
      team1 = Team.create(name: "Team", city: "City")
      player1 = team1.players.create(name: "Andrew", age: 20, position: '1B')
      player2 = team1.players.create(name: "Khoa", age: 34, position: '2B')

      expect(team1.player_count).to eq(2)
    end
  end
end
