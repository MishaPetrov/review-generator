class ReviewsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @review = @campaign.reviews.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @review = @campaign.reviews.new(review_params)
    if @review.save
      redirect_to campaign_path(@review.campaign)
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:length)
  end

end
