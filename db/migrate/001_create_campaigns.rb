class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :title, :default => '', :null => false
      t.date :start_date  #additional restraints?
      t.date :end_date    #additional restraints?
      t.integer :taxonomy_id, :default => :nil

      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
    end

    add_index :campaigns, :title, :unique => true
  end

  def self.down
    drop_table :campaigns
  end
end
