class Team < ApplicationRecord
  has_many :players, :dependent => :destroy

  def self.sort
    order('created_at ASC')
  end

  def player_count
    players.count
  end

  def self.name_search(name)
    self.all.find_all do |team|
      team.name.downcase.include?(name.downcase)
    end
  end

end
