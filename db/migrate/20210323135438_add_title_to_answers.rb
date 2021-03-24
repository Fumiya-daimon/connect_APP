class AddTitleToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :title, :string
  end
end
