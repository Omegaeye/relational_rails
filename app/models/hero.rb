class Hero < ApplicationRecord
  has_many :mounts, :dependent => :destroy
  validates :name, presence: true

  def self.sorted_by_created_at
    order('created_at')
  end

  def self.number_of_mounts
    left_joins(:mounts).group(:id).order('COUNT(mounts.id) DESC')
  end

  def mount_count
    mounts.count
  end

  def self.name_search(name)
    where("name ILIKE ?", "%#{name.capitalize}%")
  end
end
