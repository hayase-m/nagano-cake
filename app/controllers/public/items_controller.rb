class Public::ItemsController < ApplicationController
  def index
    @items = if params[:genre_id].present?
               Item.where(genre_id: params[:genre_id],
                          is_active: true).order(created_at: :desc).page(params[:page]).per(8)
             else
               Item.where(is_active: true).order(created_at: :desc).page(params[:page]).per(8)
             end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
