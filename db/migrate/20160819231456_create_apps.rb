class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :description
      t.string :color
      t.boolean :status

      t.timestamps null: false
    end
  end
end
