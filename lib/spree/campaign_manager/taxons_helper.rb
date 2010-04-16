module Spree::CampaignManager::TaxonsHelper
  def self.included(target)
    target.class_eval do
      alias :spree_breadcrumbs :breadcrumbs
      def breadcrumbs(taxon, separator="&nbsp;&raquo;&nbsp;")
        campaign_manager_breadcrumbs(taxon, separator="&nbsp;&raquo;&nbsp;")
      end
    end
  end

  def campaign_manager_breadcrumbs(taxon, separator="&nbsp;&raquo;&nbsp;")
    return if !@campaign.nil?
    spree_breadcrumbs(taxon, separator)
  end
end
