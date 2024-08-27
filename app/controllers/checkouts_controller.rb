class CheckoutsController < ApplicationController
  def new
  end
  
  def create
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: 'Custom Payment',
          },
          unit_amount: 5000,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: root_url + 'success',
      cancel_url: root_url + 'cancel',
    )
    redirect_to @session.url, allow_other_host: true
  end
end
