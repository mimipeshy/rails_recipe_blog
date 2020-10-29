class CreateRecipeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
