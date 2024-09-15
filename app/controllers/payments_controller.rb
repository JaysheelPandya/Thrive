class PaymentsController < ApplicationController
  def create_checkout_session
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: 'Sample Product',
          },
          unit_amount: 2000, # amount in cents
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: success_url,
      cancel_url: cancel_url,
    })

    redirect_to session.url, allow_other_host: true
  end
end
