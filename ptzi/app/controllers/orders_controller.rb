# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new; end

  def create
    result = ::Orders::Create.result(attributes: order_params.to_h)
    if result.success?
      redirect_to orders_path, notice: 'Criado'
    else
      redirect_to new_order_path, alert: result.error
    end
  end

  def destroy
    result = ::Orders::Destroy.result(id: params[:id])
    if result.success?
      redirect_to orders_path, notice: 'Destruído'
    else
      redirect_to orders_path, alert: result.error
    end
  end

  private

  def order_params
    params.require(:order).permit(:file, :imei, :annual_price, :device_model, :installments)
  end
end
