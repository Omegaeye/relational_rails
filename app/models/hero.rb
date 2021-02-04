class Hero < ApplicationRecord
  has_many :mounts, :dependent => :destroy
end
