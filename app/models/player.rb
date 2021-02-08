class Player < ApplicationRecord
  belongs_to :team

  def self.starters
    where(starter: true)
  end

  def self.over_age(num)
    if num == ''
      where("age > 0")
    else
      where("age > ?", num)
    end
  end

  def self.sorted
    order("name")
  end

  def self.name_search(name)
    if name == ''
      where(starter: true)
    else
      where("name ILIKE ?", "%#{name.capitalize}%")
    end
  end
end
