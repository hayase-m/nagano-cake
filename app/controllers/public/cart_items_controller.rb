class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index; end

  def update; end

  def destroy; end

  def destroy_all; end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(params[:cart_item][:item_id])
      render 'public/items/show'
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
