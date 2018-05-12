class ReviewsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @review = @campaign.reviews.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @review = @campaign.reviews.new(review_params)
    length = review_params["length"].to_i
    @review.content = generate_service_review(length)
    if @review.save
      redirect_to campaign_path(@review.campaign)
    else
      render :new
    end
  end

private

  personal_pronouns = ["I", "you", "he", "she", "it", "we", "you", "they"]
  possessive_pronouns = ["mine", "yours", "his", "hers", "its", "ours", "yours", "theirs"]
  time = ["just", "recently", "few days ago", "yestersay", "last week", "last month"]

  # Moving and cleaning services specific
  place_size = ["1br", "1 bedroom", "one bedroom", "2br", "2 bedroom", "two bedroom", "3br", "3 bedroom", "three bedroom", "4br", "4 bedroom", "four bedroom"]
  place_type = ["apartment", "condo", "house", "duplex", "single home"]

  # Moving specific
  intro_sentences = ["(reviewer) just moved from a (place) to a (place) with the help of (company)"]

  def review_params
    params.require(:review).permit(:length)
  end

  def generate_service_review(length)
    return "Fuck you!"
  end

  def generate_product_review(length)

  end

end
