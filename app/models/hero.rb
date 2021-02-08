class Hero < ApplicationRecord
  has_many :mounts, :dependent => :destroy
  validates :name, presence: true

  def self.sorted_by_created_at
    self.all.sort_by do |hero|
      hero.created_at
    end
  end

  def self.number_of_mounts
    self.all.sort_by do |hero|
      hero.mounts.count
    end.reverse
  end

  def mount_count
    mounts.count
  end

  def self.name_search(name)
    self.all.find_all do |hero|
      hero.name.downcase.include?(name.downcase)
    end
  end
end
