class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.string :status
      t.boolean :visable, default: true

      t.timestamps
    end
  end
end
