class Hero < ApplicationRecord
  has_many :mounts, :dependent => :destroy
  validates :name, presence: true

  def self.sorted
    self.all.sort_by do |hero|
      hero.name.downcase
    end
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
