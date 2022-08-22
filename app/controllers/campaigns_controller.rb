class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :destroy]
  def index
    @campaigns = policy_scope(Campaign)
  end

  def new
    @campaign = Campaign.new
    authorize @campaign
  end

  def show
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user
    authorize @campaign

    if @campaign.save
      redirect_to @campaign
      flash[:notice] = "Successfully Craeted Campaign"
    else
      render :new
    end
  end

  def destroy
    title = @campaign.title
    @campaign.destroy
    redirect_to campaigns_path
    flash[:notice] = "Successfully Deleted Campaign #{title}"
  end

  private

  def campaign_params
    params.require(:campaign).permit(
      :title, :description, :active, :maximum_player_count
    )
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end
end
