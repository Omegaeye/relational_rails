class Mount < ApplicationRecord
  belongs_to :hero

  def self.sorted
    order("name ASC")
  end

  def self.fly
    self.all.find_all do |mount|
      mount.fly == true
    end
  end

  def self.level_above(threshold)
    where("level > #{threshold}")
  end
end
