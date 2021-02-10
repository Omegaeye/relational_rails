class Player < ApplicationRecord
  belongs_to :team

  def self.starters
    where(starter: true)
  end

  def self.over_age(num)
    if num == ''
      where("age > 0").order("created_at")
    else
      where("age > ?", num)
    end
  end
end
