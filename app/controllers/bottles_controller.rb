class BottlesController < ApplicationController
  before_action :set_bottle, only: %i[show]

  def index
    @bottles = Bottle.all
  end

  def show
    @rating = Rating.new
  end

  private

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end
end
