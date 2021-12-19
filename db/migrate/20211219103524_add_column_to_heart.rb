class AddColumnToHeart < ActiveRecord::Migration[7.0]
  def change
    add_column(:hearts, :sessions, :string)
  end
end
