class CreateCompanyPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :company_posts do |t|
      t.references :company_id, null: false, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
