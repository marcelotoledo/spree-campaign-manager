class CampaignManagerHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_tabs do
    %(<%= tab(:campaigns) %>)
  end
end
