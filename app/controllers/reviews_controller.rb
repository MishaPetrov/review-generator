class ReviewsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @review = @campaign.reviews.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @review = @campaign.reviews.new(review_params)
    length = review_params["length"].to_i
    @review.content = @review.generate_service_review(length)
    if @review.save
      redirect_to campaign_path(@review.campaign)
    else
      render :new
    end
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @review = @campaign.reviews.find(params[:id])
    @review.destroy
    redirect_to campaign_path(@campaign)
  end

private

  def review_params
    params.require(:review).permit(:length)
  end



end
