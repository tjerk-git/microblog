class CreateNewsletters < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletters do |t|
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps
    end
  end
end
