class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.where(:user_id => current_user.id)
    render :index
  end

  def show
    @campaign = Campaign.find(params[:id])
    render :show
  end

  def new
    @campaign = Campaign.new
    render :new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_tpo campaigns_path
    else
      render :new
    end
  end

private
  def campaign_params
    params.require(:campaign).permit(:name, :type_name, :specialization, :user_id)
  end
end
