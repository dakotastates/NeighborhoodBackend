class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :city
      t.belongs_to :profile, null: false, foreign_key: true
      t.boolean :visable, default: true

      t.timestamps
    end
  end
end
