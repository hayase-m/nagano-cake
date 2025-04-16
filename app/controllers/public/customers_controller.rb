class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show; end

  def edit; end

  def update; end

  def unsubscribe; end

  def withdraw
    current_customer.update(is_active: false)
    reset_session
    flash[:notice] = '退会処理が完了しました。'
    redirect_to root_path
  end
end
