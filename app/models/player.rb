class Player < ApplicationRecord
  belongs_to :team

  def self.starters
    self.all.find_all do |player|
      player.starter == true
    end
  end

  def self.over_age(num)
    where("age > ?", num)
  end

  def self.sorted
    self.all.sort_by do |player|
      player.name
    end
  end
end
