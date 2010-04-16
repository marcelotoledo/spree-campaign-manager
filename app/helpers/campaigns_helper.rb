module CampaignsHelper
  def campaign_seo_url(campaign, taxon)
    return "/campaigns/#{campaign.id}/#{taxon.permalink}"
  end

  def special_breadcrumbs(campaign, taxon, separator="&nbsp;&raquo;&nbsp;")
    crumbs = [content_tag(:li, link_to(t(:home) , root_path) + separator)]
    crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name , campaign_seo_url(campaign, ancestor)) + separator) } unless taxon.ancestors.empty?
    crumbs << content_tag(:li, content_tag(:span, taxon.name))
    crumb_list = content_tag(:ul, crumbs.flatten.map{|li| li.mb_chars}.join)
    content_tag(:div, crumb_list + tag(:br, {:class => 'clear'}, false, true), :class => 'breadcrumbs')
  end  
end
