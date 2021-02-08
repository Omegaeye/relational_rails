class Mount < ApplicationRecord
  belongs_to :hero
  validates :name, presence: true

  def self.sorted
    order('name')
  end

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

  def self.name_search(name)
    where("name ILIKE ?", "%#{name.capitalize}%")
  end
end
