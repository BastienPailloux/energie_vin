class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    if @rating.save!
      redirect_to bottle_path(@rating.bottle)
    else
      render 'show', status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rate, :comment, :bottle_id, :user_id)
  end
end
