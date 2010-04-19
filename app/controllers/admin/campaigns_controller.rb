class Admin::CampaignsController < Admin::BaseController
  resource_controller

  update.response do |wants|
    wants.html { redirect_to collection_url }
  end

  create.response do |wants|
    wants.html { redirect_to collection_url }
  end
private
  def collection
    @search = Campaign.searchlogic(params[:search])

    @search.order ||= "ascend_by_start_date"

    @collection_count = @search.count
    @collection = @search.paginate(:per_page => 10, :page => params[:page])
  end
end
