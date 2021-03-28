class Add < ActiveRecord::Migration[6.0]
  def change
    drop_table :likes
    drop_table :comments
  end
end
