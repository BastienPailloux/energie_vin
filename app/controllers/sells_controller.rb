class SellsController < ApplicationController
  def index
    @bottle = Bottle.find(params[:bottle_id])
    @sells = Sell.where(bottle: @bottle)
    @average_price = @sells.average(:price).round(2)
  end
end
