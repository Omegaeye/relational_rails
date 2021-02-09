class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sorted
    order("name")
  end

  def self.sorted_by_created_at
    order("created_at")
  end

  def self.name_search(name)
    where("name ILIKE ?", "%#{name.capitalize}%")
  end
end
