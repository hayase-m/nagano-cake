class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show; end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = '会員情報を更新しました'
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe; end

  def withdraw
    current_customer.update(is_active: false)
    reset_session
    flash[:notice] = '退会処理が完了しました。'
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code,
                                     :address, :telephone_number, :email)
  end
end
