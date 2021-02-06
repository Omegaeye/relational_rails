class Player < ApplicationRecord
  belongs_to :team

  def self.starters
    self.all.find_all do |player|
      player.starter == true
    end
  end

  def self.over_age(num)
    if num == ''
      where("age > 0")
    else
      where("age > ?", num)
    end
  end

  def self.sorted
    self.all.sort_by do |player|
      player.name
    end
  end

  def self.name_search(name)
    self.all.find_all do |player|
      player.name.downcase.include?(name.downcase)
    end
  end
end
