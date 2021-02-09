class Team < ApplicationRecord
  has_many :players, :dependent => :destroy

  def player_count
    players.count
  end

  def self.number_of_players
    left_joins(:players).group(:id).order('COUNT(players.id) DESC')
  end

end
