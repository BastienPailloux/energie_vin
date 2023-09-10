class SellsController < ApplicationController
  def index
    @bottle = Bottle.find(params[:bottle_id])
    @sells = Sell.where(bottle: @bottle)
  end
end
