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
    @order = Order.new(final_order_params)

    if @order.save
      CartItem.where(customer_id: current_customer.id).destroy_all
      redirect_to thanks_orders_path
    else
      render :confirm
    end
  end

  def index; end

  def show; end

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
