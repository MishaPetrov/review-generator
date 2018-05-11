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
      redirect_to campaigns_path
    else
      render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
    render :edit
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      redirect_to
    else
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to campaigns_path
  end

private
  def campaign_params
    params.require(:campaign).permit(:name, :type_name, :specialization, :user_id)
  end
end
