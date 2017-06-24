class InShoppingCartsController < ApplicationController
    def create
      #agregr un carrito de compras
      in_shopping_cart = InShoppingCart.new(product_id: params[:product_id],
                                      shopping_cart: @shopping_cart)
      if in_shopping_cart.save
        redirect_to "/carrito", notice: "Guardado en tu mandado!"
      else
        redirect_to products_path(id: params[:product_id]), notice: "No se guardo tu mandado :(, intentalo de nuevo, va?"
      end
    end
    
    def destroy
      #eliminar un carrito de compras
      @in_shopping_cart = InShoppingCart.find(params[:id])
      
      @in_shopping_cart.destroy
      
      redirect_to carrito_path
    end
end
