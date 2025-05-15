class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params_for_status_update)
      flash[:notice] = '注文ステータスを更新しました'
      redirect_to admin_order_path(@order)
    else
      @order_details = @order.order_details
      flash[:alert] = '注文ステータスの更新に失敗しました'
      render :show
    end
  end

  def order_params_for_status_update
    params.require(:order).permit(:status)
  end
end
