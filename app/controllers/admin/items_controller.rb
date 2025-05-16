class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = if params[:search].present?
               Item.where('name LIKE ?', "%#{params[:search]}%").order(created_at: :desc).page(params[:page]).per(10)
             else
               Item.order(created_at: :desc).page(params[:page]).per(10)
             end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item), notice: '商品が登録されました'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item), notice: '商品情報が更新されました'
    else
      flash.now[:alert] = '商品情報の更新に失敗しました'
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :item_image)
  end
end
