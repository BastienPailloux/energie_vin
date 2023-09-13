class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @bottles = Bottle.all.order_by_rate
    @min_price = 0
    @max_price = 2000
    if params[:min_price].present? || params[:max_price].present?
      @bottles = @bottles.select { |bottle| bottle.price.between?(params[:min_price].to_i, params[:max_price].to_i) }
      @min_price = params[:min_price].to_i
      @max_price = params[:max_price].to_i
    end
  end
end
