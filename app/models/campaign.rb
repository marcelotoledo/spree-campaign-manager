class Campaign < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :taxonomy
  has_attached_file :image,
    :styles => { :thumb => "100x100#", :large => "400x400>" },
    :default_style => :large,
    :url => "/assets/campaigns/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/campaigns/:id/:style/:basename.:extension"
end
