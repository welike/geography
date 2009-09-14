class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name
      t.string :description
      t.integer :county_id
      t.integer :state_id
      t.integer :country_id
      t.boolean :active, :default => false

      t.timestamps
    end
    
    Region.create(:name => 'San Francisco Bay Area', 
                  :description => 'Home of the 49ers, Silicon Valley, and redwood trees!', 
                  :active => true)
  end

  def self.down
    drop_table :regions
  end
end
