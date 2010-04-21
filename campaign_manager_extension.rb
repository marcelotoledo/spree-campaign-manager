class CampaignManagerExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/campaign_manager"

  def activate
    TaxonsHelper.send(:include, Spree::CampaignManager::TaxonsHelper)
  end
end
