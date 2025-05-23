class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = '配送先を設定しました'
      redirect_to addresses_path
    else
      flash[:notice] = '配送先を設定に失敗しました'
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = '配送先を更新しました'
      redirect_to addresses_path
    else
      flash[:notice] = '配送先を更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = '配送先を削除しました'
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
