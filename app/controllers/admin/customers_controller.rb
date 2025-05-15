class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.order(created_at: :asc).page(params[:page]).per(10)
  end

  def show; end

  def edit; end

  def update; end
end
