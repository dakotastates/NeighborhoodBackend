class CreateOccupations < ActiveRecord::Migration[6.1]
  def change
    create_table :occupations do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.string :company
      t.string :position
      t.string :city
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
