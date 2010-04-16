# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class CampaignManagerExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/campaign_manager"

  # Please use campaign_manager/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    TaxonsHelper.send(:include, Spree::CampaignManager::TaxonsHelper)
  end
end
