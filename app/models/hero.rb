class Hero < ApplicationRecord
  has_many :mounts, :dependent => :destroy
  validates :name, :level, presence: true


  def self.number_of_mounts
    left_joins(:mounts).group(:id).order('COUNT(mounts.id) DESC')
  end

  def mount_count
    mounts.count
  end
end
