class SearchesController < ApplicationController
  before_action :set_user, only: %i[index create]
  before_action :set_search, only: %i[show destroy]

  def index
    @searches = Search.where(user_id: @user.id)
  end

  def show
    @bottles = Bottle.all.order_by_rate.select { |bottle| bottle.price.between?(@search.min_price.to_i, @search.max_price.to_i) }
  end

  def create
    @search = Search.new(
      min_price: params[:min_price],
      max_price: params[:max_price],
      user: @user,
      condition: "entre #{params[:min_price]}€ et #{params[:max_price]}€"
    )
    @search.save!
  end

  def destroy
    @search.destroy
    redirect_to user_searches_path(current_user)
  end

  private

  def set_search
    @search = Search.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
