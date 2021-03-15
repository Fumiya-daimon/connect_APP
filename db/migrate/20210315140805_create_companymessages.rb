class CreateCompanymessages < ActiveRecord::Migration[6.0]
  def change
    create_table :companymessages do |t|
      t.references :companyroom, null: false, foreign_key: true
      t.boolean :is_user
      t.text :content

      t.timestamps
    end
  end
end
