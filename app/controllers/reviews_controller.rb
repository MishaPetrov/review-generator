class ReviewsController < ApplicationController
  def index
    @reviews = Reviews.all
    render :index
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @review = @campaign.reviews.new
  end
end
