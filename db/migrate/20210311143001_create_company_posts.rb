class CreateCompanyPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :company_posts do |t|
      t.string :company_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
