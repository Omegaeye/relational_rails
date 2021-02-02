class AddAttributesToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :rank, :integer
    add_column :teams, :first_place, :boolean
    add_column :teams, :created_at, :datetime
    add_column :teams, :updated_at, :datetime
  end
end
