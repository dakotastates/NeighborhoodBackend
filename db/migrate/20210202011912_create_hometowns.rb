class CreateHometowns < ActiveRecord::Migration[6.1]
  def change
    create_table :hometowns do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.string :hometown
      t.boolean :visable, default: true

      t.timestamps
    end
  end
end
