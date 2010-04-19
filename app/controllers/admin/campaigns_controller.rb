class Admin::CampaignsController < Admin::BaseController
  # TODO: Add pagination, Add sorting 

  resource_controller

  update.response do |wants|
    wants.html { redirect_to collection_url }
  end

  create.response do |wants|
    wants.html { redirect_to collection_url }
  end
private
  def collection
    #@collection ||= Campaign.all.sort_by{ |c| c.start_date}.reverse
    @search = Campaign.searchlogic(params[:search])

    @search.order ||= "descend_by_start_date"

    @collection_count = @search.count
    @collection = @search.paginate(:per_page => 10, :page => params[:page])
  end
end
