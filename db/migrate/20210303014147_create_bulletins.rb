class CreateBulletins < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletins do |t|
      t.text :bulletin
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
