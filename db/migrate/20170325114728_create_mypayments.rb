class CreateMypayments < ActiveRecord::Migration
  def change
    create_table :mypayments do |t|
      t.string :email
      t.string :ip
      t.string :status
      t.decimal :fee, precision: 6, scale: 2
      t.string :paypal_id
      t.decimal :total, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
