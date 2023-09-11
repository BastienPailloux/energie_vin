class BottlesController < ApplicationController
  before_action :set_bottle, only: %i[show]

  def index
    @bottles = Bottle.all.order_by_rate
    @min_price = 0
    @max_price = 2000
    if params[:minPrice].present? || params[:maxPrice].present?
      @bottles = @bottles.select { |bottle| bottle.price.between?(params[:minPrice].to_i, params[:maxPrice].to_i) }
      @min_price = params[:minPrice].to_i
      @max_price = params[:maxPrice].to_i
    end
  end

  def show
    @rating = Rating.new
  end

  private

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end
end
