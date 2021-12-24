class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :link
      t.references :newsletter, null: false, foreign_key: true
      t.timestamps
    end
  end
end
