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

      expect(Team.sort).to eq([team1, team2])
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
