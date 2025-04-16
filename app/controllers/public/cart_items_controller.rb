class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      @cart_items = CartItem.all
      @total = 0
      render :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      flash[:notice] = 'カートから削除しました'
      redirect_to cart_items_path
    else
      @cart_items = CartItem.all
      @total = 0
      render :index
    end
  end

  def destroy_all
    if CartItem.where(customer_id: current_customer.id).destroy_all
      flash[:notice] = 'カートを空にしました'
      redirect_to cart_items_path
    else
      @cart_items = CartItem.all
      render :index
    end
  end

  def create
    @cart_items = current_customer.cart_items
    @cart_item = @cart_items.find_by(item_id: cart_item_params[:item_id])
    if @cart_item
      if @cart_item.update(amount: @cart_item.amount.to_i + cart_item_params[:amount].to_i)
        redirect_to cart_items_path
      else
        render_item_show
      end
    else
      @new_cart_item = CartItem.new(cart_item_params)
      @new_cart_item.customer_id = current_customer.id
      if @new_cart_item.save
        redirect_to cart_items_path
      else
        render_item_show
      end
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

  def render_item_show
    @item = Item.find(params[:cart_item][:item_id])
    @cart_item = CartItem.new
    render 'public/items/show'
  end
end
