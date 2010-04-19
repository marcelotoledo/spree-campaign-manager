class Campaign < ActiveRecord::Base
  validates_presence_of :title, :start_date, :end_date, :taxonomy_id
  validates_uniqueness_of :title

  def validate
    errors.add_to_base "Campaign start date must be before end date" if start_date > end_date
  end

  belongs_to :taxonomy
  has_attached_file :image,
    :styles => { :thumb => "201x50>", :large => "700x174>" },
    :default_style => :large,
    :url => "/assets/campaigns/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/campaigns/:id/:style/:basename.:extension"

  def expired?
    self.end_date < Date.today
  end

  def in_the_future?
    self.start_date > Date.today
  end
end
