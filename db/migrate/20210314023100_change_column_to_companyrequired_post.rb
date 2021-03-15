class ChangeColumnToCompanyrequiredPost < ActiveRecord::Migration[6.0]
  def change
      remove_foreign_key :companyrequired_posts, :company_posts
      remove_reference :companyrequired_posts, :company_post, index:true
  end
end
