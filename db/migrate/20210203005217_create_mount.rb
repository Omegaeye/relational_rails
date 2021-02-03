class CreateMount < ActiveRecord::Migration[5.2]
  def change
    create_table :mounts do |t|
      t.string :name
      t.integer :heroes_id
      t.integer :level
      t.boolean :fly
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
