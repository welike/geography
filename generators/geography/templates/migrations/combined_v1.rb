class CreateGeographyTables < ActiveRecord::Migration
  def self.up
    
    create_table :continents do |t|
      t.string :name, :null => false
      t.string :description, :null => true
      t.string :iso_3166_code, :null => false
      t.timestamps
    end
    
    create_table :countries do |t|
      t.string :name
      t.string :official_name
      t.string :description
      t.string :iso_3166_continent_alpha_code
      t.integer :continent_id
      t.string :iso_3166_1_alpha_2
      t.string :iso_3166_1_alpha_3
      t.string :iso_3166_1_numeric_code
      t.string :tld
      t.string :fips_10_4_alpha_code
      t.timestamps
    end
    
    create_table :states do |t|
      t.string :name
      t.string :official_name
      t.string :description
      t.string :iso_3166_2_alpha_code
      t.string :fips_5_2_numeric_code
      t.string :fips_5_2_alpha_code
      t.timestamps
    end
    
    create_table :regions do |t|
      t.string :name
      t.string :description
      t.integer :country_id
      t.integer :state_id
      t.boolean :active, :default => false
      t.timestamps
    end
    
    create_table :counties do |t|
      t.string :name
      t.string :description
      t.integer :country_id
      t.string :fips_state_name
      t.string :fips_state_numeric_code
      t.string :fips_county_numeric_code
      t.string :fips_county_name
      t.string :fips_class_code
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    
    
  end

  def self.down
    drop_table :continents
    drop_table :countries
    drop_table :states
    drop_table :regions
    drop_table :counties
  end
end
