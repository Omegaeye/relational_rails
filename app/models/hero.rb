class Hero < ApplicationRecord
  has_many :mounts, :dependent => :destroy
  validates :name, presence: true

  def self.sorted_by_created_at
    order('created_at')
  end

  def self.number_of_mounts
    self.all.sort_by do |hero|
      hero.mounts.count
    end.reverse
  end

  def self.mounts_above_level(level)
    self.all.find_all do |hero|
      hero.mounts.level_above(level)
    end
  end

  def mount_count
    mounts.count
  end

  def self.name_search(name)
    # self.all.find_all do |hero|
    #   hero.name.downcase.include?(name.downcase)
    # end
    where(name: "%#{name.capitalize}%")
  end
end
