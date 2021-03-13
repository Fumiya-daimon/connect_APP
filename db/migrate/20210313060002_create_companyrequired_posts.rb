class CreateCompanyrequiredPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :companyrequired_posts do |t|
      t.references :company, null: false, foreign_key: true
      t.references :company_post, null: false, foreign_key: true
      t.string :title
      t.string :required_person
      t.string :content

      t.timestamps
    end
  end
end
