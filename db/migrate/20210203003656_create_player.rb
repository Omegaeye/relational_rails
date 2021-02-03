class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :age
      t.boolean :starter
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :team_id
    end
  end
end
