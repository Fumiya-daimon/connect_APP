class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :skill, :string, null: false
    add_column :users, :job, :string, null: false
    add_column :users, :image, :string
  end
end
