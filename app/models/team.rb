class Team < ApplicationRecord
  has_many :players, :dependent => :destroy

  def self.sort
    order('created_at ASC')
  end

  def player_count
    players.count
  end

end
