class Mount < ApplicationRecord
  belongs_to :hero

  def self.sorted
    order('LOWER(name)')
  end

  def self.fly
    self.all.find_all do |mount|
      mount.fly == true
    end
  end

  def self.level_above(threshold)
    if threshold == ""
      where("level > 0")
    else
      where("level > #{threshold}")
    end
  end

  def self.name_search(name)
    self.all.find_all do |mount|
      mount.name.downcase.include?(name.downcase)
    end
  end
end
