class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :id_category
      t.integer :id_colection

      t.timestamps null: false
    end
  end
end
