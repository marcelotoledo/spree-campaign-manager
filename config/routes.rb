map.root :controller => "campaigns", :action => "index"
map.nested_campaign_taxons 'campaigns/*id', :controller => "campaigns", :action => "show"

map.namespace :admin do |admin|
  admin.resources :campaigns
end
