class RemoveHeroesIdFromMounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :mounts, :heroes_id, :integer
  end
end
