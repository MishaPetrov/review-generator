class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.where(:user_id => current_user.id)
    render :index
  end

  def show
    @campaign = Campaign.find(params[:id])
    render :show
  end
end
