class CreateNeighborships < ActiveRecord::Migration[6.1]
  def change
    create_table :neighborships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :neighbor, null: false

      t.timestamps
    end
    add_foreign_key :neighborships, :users, column: :neighbor_id
  end
end
