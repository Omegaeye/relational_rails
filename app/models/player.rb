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
      self.all.starters.sort_by do |player|
        player.created_at
      end
    else
      self.all.find_all do |player|
        player.name.downcase.include?(name.downcase)
      end
    end
  end
end
