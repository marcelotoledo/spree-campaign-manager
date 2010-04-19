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
    ['expired', 'future'].each { |type| @campaigns[type]['data'] = @campaigns[type]['data'].sort_by { |c| c.start_date }.reverse[0..9] }
  end

  def show
    begin
      @campaign = Campaign.find(params[:id].first)
    rescue ActiveRecord::RecordNotFound
    end
    redirect_to :action => :index and return if @campaign.nil? || @campaign.in_the_future? || @campaign.expired?

    @campaigns = Campaign.all.select { |c| !c.in_the_future? && !c.expired? && c != @campaign }

    p_length = params[:id].length
    @taxon = p_length == 1 ? @campaign.taxonomy.root : Taxon.find_by_permalink(params[:id].slice(1, p_length).join('/') + '/')
    retrieve_products
    @paginated_products = @products
    @title = @campaign.title
  end
end
