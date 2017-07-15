class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :pricing
      t.text :description
      t.string :img_prod
      t.integer :id_tag

      t.timestamps null: false
    end
  end
  

end
