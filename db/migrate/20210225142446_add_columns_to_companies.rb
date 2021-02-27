class AddColumnsToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :name, :string
    add_column :companies, :image, :string
    add_column :companies, :industry, :string
    add_column :companies, :required_person, :string
  end
end
