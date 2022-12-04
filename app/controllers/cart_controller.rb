class CartController < ApplicationController
  def show
    render layout: "checkout"
    @render_cart = true
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
    end
    puts Orderable.count
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    redirect_to "/cart"
  end

  def update
    add
    redirect_to "/cart"
  end

  def checkout
    puts "here"
    

# This is your test secret API key.
    Stripe.api_key = "sk_test_51Lzm35C1N3KXwRbw8iBxvZVZZIK1FNaL3zYrNU1qnTSKcPJGaVHLQqX8fVDdYdOQUdu6e0EHXyVZNd2HDYoVeecr00l2hcAOrs"
    total = @cart.total
    total = total.to_i
    email = current_user.email
    path = 'https://cdn-icons-png.flaticon.com/512/2548/2548670.png'

    session = Stripe::Checkout::Session.create({
    line_items: [{
      # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
                   price_data: {
                     currency: "usd",
                     product_data: {
                       name: "Order",
                       images: [path]},
                     unit_amount: total*100},
                   quantity: 1
                 }],
    mode: 'payment',
    customer_email: email,
    success_url: "http://localhost:3000" + cart_success_path,
    cancel_url: "http://localhost:3000/cart",
    automatic_tax: {enabled: false},
                                               })
    puts session.url
    redirect_to session.url, allow_other_host: true
  end

  def success
    Orderable.delete_all
  end
end
