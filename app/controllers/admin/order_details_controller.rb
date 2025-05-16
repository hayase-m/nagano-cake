class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order

    if @order_detail.update(order_detail_params)
      @order.update(status: 'production') if @order.order_details.any? do |details|
        details.making_status == 'production'
      end
      @order.update(status: 'preparation') if @order.order_details.all? do |details|
        details.making_status == 'completed'
      end
    end

    flash[:notice] = '製作ステータスを更新しました'
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
