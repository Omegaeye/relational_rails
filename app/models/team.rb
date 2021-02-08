class Team < ApplicationRecord
  has_many :players, :dependent => :destroy

  def self.sorted
    order('created_at ASC')
  end

  def player_count
    players.count
  end

  def self.name_search(name)
    where("name ILIKE ?", "%#{name.capitalize}%")
  end

  def self.number_of_players
    left_joins(:players).group(:id).order('COUNT(players.id) DESC')
  end

end
