class BottlesController < ApplicationController
  before_action :set_bottle, only: %i[show]

  def index
    @bottles = Bottle.all.order_by_rate
    @min_price = 0
    @max_price = 2000
    if params[:min_price].present? || params[:max_price].present?
      @bottles = @bottles.select { |bottle| bottle.price.between?(params[:min_price].to_i, params[:max_price].to_i) }
      @min_price = params[:min_price].to_i
      @max_price = params[:max_price].to_i
    end
  end

  def show
    @rating = Rating.new
    @sells = Sell.where(bottle: @bottle)
    @average_price = @sells.average(:price).round(2)
    @price_evolution = ((1 - (@average_price / @sells.last.price)) * 100).round(2)
  end

  private

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end
end
