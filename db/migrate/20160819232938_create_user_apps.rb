class CreateUserApps < ActiveRecord::Migration
  def change
    create_table :user_apps do |t|
      t.string :name
      t.string :description
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :app, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
