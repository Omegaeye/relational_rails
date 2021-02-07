class Team < ApplicationRecord
  has_many :players, :dependent => :destroy

  def self.sort
    order('created_at ASC')
  end

  def player_count
    players.count
  end

  def self.name_search(name)
    if name == ''
      self.all.sort_by do |team|
        team.created_at
      end
    else
      self.all.find_all do |team|
        team.name.downcase.include?(name.downcase)
      end
    end
  end

  def self.number_of_players
    self.all.sort_by do |team|
      team.players.count
    end.reverse
  end

end
