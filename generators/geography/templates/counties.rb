class CreateCounties < ActiveRecord::Migration
  def self.up
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
    drop_table :counties
  end
end
