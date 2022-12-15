class CheckoutController < ApplicationController
  require "stripe"

  def create
    orderables = @cart.orderables.all

    product_list = []

    orderables.each do |orderable|
      price = orderable.product.price * 100
      product_list.append(
        {
          price_data: {
            currency:     "cad",
            unit_amount:  price.to_i,
            product_data: {
              name: orderable.product.name
            },
            tax_behavior: "exclusive"
          },
          quantity:   orderable.quantity
        }
      )
    end
    json_item_list = product_list.to_json
    link = Stripe::Checkout::Session.create({
                                              success_url:      "http://127.0.0.1:3000/",
                                              cancel_url:       "http://127.0.0.1:3000/cart",
                                              line_items:       JSON.parse(json_item_list),
                                              mode:             "payment",
                                              invoice_creation: { enabled: true }
                                            })
    # tell stripe to create an invoice
    redirect_to link.url, allow_other_host: true, protocol: :all, data: { turbo: false }
  end
end
