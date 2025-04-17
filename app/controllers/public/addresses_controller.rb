class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
  end

  def edit; end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = '配送先を設定しました'
      redirect_to addresses_path
    else
      flash[:notice] = '配送先を設定できませんでした'
      render :index
    end
  end

  def update; end

  def destroy; end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
