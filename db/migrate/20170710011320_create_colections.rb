class CreateColections < ActiveRecord::Migration
  def change
    create_table :colections do |t|
      t.string :colect_name
      t.text :description
      t.integer :id_products

      t.timestamps null: false
    end
  end
end
