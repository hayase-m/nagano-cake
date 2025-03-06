class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items_per = Item.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
  end

end
