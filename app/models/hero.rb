class Hero < ApplicationRecord
  has_many :mounts, :dependent => :destroy
  validates :name, presence: true

  def self.order_by_creation_time
    order('created_at ASC')
  end

  def self.name_search(name)
    self.all.find_all do |hero|
      hero.name.downcase.include?(name.downcase)
    end
  end
end
