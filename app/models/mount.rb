class Mount < ApplicationRecord
  belongs_to :hero
  validates :name, :level, presence: true

  def self.fly
    where(fly: true)
  end

  def self.level_above(threshold)
    if threshold == ""
      where("level > 0")
    else
      where("level > #{threshold}")
    end
  end
end
