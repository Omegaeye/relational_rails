class Mount < ApplicationRecord
  belongs_to :hero

  def self.sorted
    order("name ASC")
  end

end
