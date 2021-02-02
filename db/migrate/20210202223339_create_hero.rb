class CreateHero < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :type
      t.integer :level
      t.boolean :alive
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
