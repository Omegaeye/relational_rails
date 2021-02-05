class Player < ApplicationRecord
  belongs_to :team

  def self.starters
    self.all.find_all do |player|
      player.starter == true
    end
  end

  def self.over_age(num)
    self.all.find_all do |player|
      player.age > num
    end
  end
end
