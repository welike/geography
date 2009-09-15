class CreateCountries < ActiveRecord::Migration
  def self.up
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
  end

  def self.down
    drop_table :countries
  end
end
