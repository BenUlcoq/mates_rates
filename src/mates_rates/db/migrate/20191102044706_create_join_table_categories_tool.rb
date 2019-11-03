class CreateJoinTableCategoriesTool < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :tools do |t|
      t.references :category, foreign_key: true
      t.references :tool, foreign_key: true
    end
  end
end
