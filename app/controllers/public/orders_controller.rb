class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @customer = current_customer
    @addresses = Address.all
  end

  def confirm
    @order = Order.new(input_order_params)
    @total = 0
    @cart_items = current_customer.cart_items

    set_order_address(@order, params[:order]) or return render :new

    render :confirm
  end

  def thanks; end

  def create
    cart_items = current_customer.cart_items
    if cart_items.empty?
      redirect_to cart_items_path, alert: 'カートが空です。'
      return
    end

    @order = Order.new(final_order_params)

    begin
      ActiveRecord::Base.transaction do
        @order.save!

        cart_items.each do |cart_item|
          order_detail = @order.order_details.build(
            item_id: cart_item.item_id,
            amount: cart_item.amount,
            price: cart_item.item.tax_included_price
          )
          order_detail.save!
        end

        cart_items.destroy_all
      end

      redirect_to thanks_orders_path
    rescue ActiveRecord::RecordInvalid => e
      flash.now[:alert] = "注文処理に失敗しました。入力内容をご確認ください。 #{e.message}"
      @cart_items = current_customer.cart_items
      render :confirm
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def set_order_address(order, order_params)
    case order_params[:select_address]
    when '0'
      order.postal_code = current_customer.postal_code
      order.address = current_customer.address
      order.name = current_customer.last_name + current_customer.first_name
    when '1'
      @address = Address.find(params[:order][:address_id])
      order.postal_code = @address.postal_code
      order.address = @address.address
      order.name = @address.name
    when '2'
      order.postal_code = order_params[:postal_code]
      order.address = order_params[:address]
      order.name = order_params[:name]
    else
      return false
    end
    true
  end

  def input_order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

  def final_order_params
    params.require(:order).permit(:customer_id, :total_payment, :payment_method, :postal_code, :address, :name)
  end
end
