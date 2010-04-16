class CampaignsController < Spree::BaseController
  include Spree::Search
  helper :taxons

  def index
    @campaigns = {
      'expired' => { 'data' => [], 'label' => 'Past Campaigns' },
      'active'  => { 'data' => [], 'label' => 'Active Campaigns' },
      'future'  => { 'data' => [], 'label' => 'Next Campaigns' }
    }
    Campaign.all.each do |campaign|
      if campaign.expired?
        @campaigns['expired']['data'] << campaign
      elsif campaign.in_the_future?
        @campaigns['future']['data'] << campaign
      else
        @campaigns['active']['data'] << campaign
      end
    end
  end

  def show
    logger.warn "steph #{params.inspect}"
    logger.warn "steph #{params[:id].first}"
     
    @campaign = Campaign.find(params[:id].first)
    redirect_to root_url if @campaign.nil? || @campaign.in_the_future? || @campaign.expired?

    @campaigns = Campaign.all.select { |c| !c.in_the_future? && !c.expired? && c != @campaign }

    p_length = params[:id].length
    @taxon = p_length == 1 ? @campaign.taxonomy.root : Taxon.find_by_permalink(params[:id].slice(1, p_length).join('/') + '/')
    retrieve_products
  end
end
