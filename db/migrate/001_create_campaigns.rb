class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :title, :default => '', :null => false
      t.date :start_date  #additional restraints?
      t.date :end_date    #additional restraints?
      t.integer :taxonomy_id, :default => :nil
      #add image link later
    end
  end

  def self.down
    drop_table :campaigns
  end
end
