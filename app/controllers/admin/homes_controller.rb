class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.order(created_at: :desc).page(params[:page]) # includesで一括読み込み
  end
end
