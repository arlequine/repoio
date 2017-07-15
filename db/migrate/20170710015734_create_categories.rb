class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :id_product
      t.integer :id_colection

      t.timestamps null: false
    end
  end
end
