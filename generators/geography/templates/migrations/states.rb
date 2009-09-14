class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name
      t.string :official_name
      t.string :description
      t.string :iso_3166_2_alpha_code
      t.string :fips_5_2_numeric_code
      t.string :fips_5_2_alpha_code

      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end