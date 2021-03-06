class PaymentsController < ApplicationController
  
  include PayPal::SDK::REST
  
  def checkout
		@my_payment = Mypayment.find_by(paypal_id: params[:paymentId])
		if @my_payment.nil?
			redirect_to "/carrito"
		else
			Stores::Paypal.checkout(params[:PayerID],params[:paymentId]) do
				
				@my_payment.update(email: Stores::Paypal.get_email(params[:paymentId]))
				@my_payment.pay!
				redirect_to ok_path,notice:"Se procesó el pago con PayPal"
				return
			end	
			redirect_to carrito_path, notice:"Hubo un error al procesar el pago"
		end
  end
 #****************************************************************************************************# 
  def process_card
    paypal_helper = Stores::Paypal.new(@shopping_cart.total,
                                  @shopping_cart.items,
                                  return_url:checkout_url,
                                  cancel_url:carrito_url)
                                  
    if paypal_helper.process_card(params).create
      @my_payment = Mypayment.create!(paypal_id: paypal_helper.payment.id,
                                  ip:request.remote_ip,
                                  email: params[:emal],
                                  shopping_cart_id: cookies[:shopping_cart_id])
      @my_payment.pay!
      redirect_to carrito_path, notice: "Genial! Ya quedo tu pago"
    else
      redirect_to carrito_path, notice: paypal_helper.payment.error
    end
  end
  #***************************************************************************************************************#
  def create
    paypal_helper = Stores::Paypal.new(@shopping_cart.total,
                                      @shopping_cart.items,
                                      return_url:checkout_url,
                                      cancel_url:carrito_url)
                                      
    
    if paypal_helper.process_payment.create
      @my_payment = Mypayment.create!(paypal_id: paypal_helper.payment.id,
                                  ip:request.remote_ip,
                                  shopping_cart_id: cookies[:shopping_cart_id])
      redirect_to paypal_helper.payment.links.find{|v| v.method == "REDIRECT" }.href
    else
      raise paypal_helper.payment.error.to_yaml
    end
  end
end
