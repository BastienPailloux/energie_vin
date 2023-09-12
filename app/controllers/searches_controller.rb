class SearchesController < ApplicationController
  def create
    search = Search.new(
      min_price: params[:min_price],
      max_price: params[:max_price],
      user: current_user,
      condition: "Entre #{params[:min_price]} et #{params[:max_price]}"
    )
    search.save!
  end
end
