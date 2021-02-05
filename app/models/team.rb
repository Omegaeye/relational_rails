class Team < ApplicationRecord
  has_many :players, :dependent => :destroy

  def self.sort
    self.all.sort_by do |team|
      team.created_at
    end
  end

  def player_count
    players.count
  end

end
