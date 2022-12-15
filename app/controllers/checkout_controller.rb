class CheckoutController < ApplicationController
  require "stripe"

  def create
    potato = Stripe::Checkout::Session.create({
                                                success_url: "http://127.0.0.1:3000/",
                                                cancel_url:  "http://127.0.0.1:3000/cart",
                                                line_items:  [
                                                  { price: "price_H5ggYwtDq4fbrJ", quantity: 2 }
                                                ],
                                                mode:        "payment"
                                              })

    redirect_to potato.url, allow_other_host: true, protocol: :all, data: { turbo: false }
  end
end
