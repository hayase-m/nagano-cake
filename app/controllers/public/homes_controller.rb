class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).page(params[:page]).per(4)
  end

  def about
  end
end
