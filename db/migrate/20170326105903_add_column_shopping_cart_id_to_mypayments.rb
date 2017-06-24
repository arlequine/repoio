class AddColumnShoppingCartIdToMypayments < ActiveRecord::Migration
  def change
    add_reference :mypayments, :shopping_cart, index: true
  end
end
