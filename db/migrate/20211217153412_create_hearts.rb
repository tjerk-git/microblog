class CreateHearts < ActiveRecord::Migration[7.0]
  def change
    create_table :hearts do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :size

      t.timestamps
    end
  end
end
