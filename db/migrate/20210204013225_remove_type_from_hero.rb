class RemoveTypeFromHero < ActiveRecord::Migration[5.2]
  def change
    remove_column :heros, :type, :string
  end
end
